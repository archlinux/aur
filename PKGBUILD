# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Allen Choong <allencch at hotmail dot com>
# Contributor: Indeed <fengjared at gmail dot com>

# Arch 32 is untested and unlikely to work. Patches welcome.

_opt_RPM=1
# 0 = deb
# 1 = rpm

# https://askubuntu.com/questions/314833/diagnosing-the-problem-when-canon-printer-fails-to-print-under-ubuntu
_opt_altver=3
# 0 all files from latest version only
# 1-3 to mix in some files from an old version to squash bugs
#   1 Mix from original tar. These tar are large and Canon makes old versions unavailable in less than 2 years. Noone wants to supply these.
#   2 same as 1 but generate bsdiff file
#   3 Mix from bspatch files generated in 2

_opt_use_other=0
# 0 = use this package complete
# 1 = exclude files for use with cndrvcups-common-lb
# 2 = exclude files for use with cndrvcups-lb
#   Package cndrvcups-lb adds symlinks for /usr/lib32/libColorGearC.so.1.0.0 during install
#   This causes conflict when switching over. Use --force

_opt_32bitonly=0
# 0 = 64 bit files which have many 32 bit files mixed in
# 1 = Use all 32 bit files on 64 bit platform.
#   This doesn't work because 64 bit ghostscript can't load 32-bit .so for -sDEVICE=opvp -sDriver=libcanonc3pl.so

_opt_debug_cnpkmoduleufr2=0
# 0 = normal
# 1 = add old lib32-glibc to cnpkmoduleufr2
# dmesg
# cnpkmoduleufr2[1531]: segfault at 0 ip 00000000f7607cc3 sp 00000000ff9a34f0 error 4 in libc-2.26.so[f758a000+1c8000]

_opt_debug_pstoufr2cpca=0
# 0 = normal
# 1 = add strace debug code to filter. See /tmp for output. See /usr/lib/cups/filter/pstoufr2cpca.inst.sh for installer if using with cndrvcups-lb
# grep -Fe $'execv\n.so\nENOENT' /tmp/pstoufr2cpca.*.strace | less -S
# /libca

# lib/libcanonc3pl.so", O       Canon

# exec c3pldrv -i 12 -o 15
# lib32/libdl.so.2
# lib32/libcaepcm.so.1
# lib32/libc.so.6
# lib32/libm.so.6
# lib32/libpthread.so.0
# lib32/librt.so.1
# lib/libc3pl.so

# exec c3pldrv -i 11 -o 16
# lib32/libdl.so.2              core/glibc
# lib32/libcaepcm.so.1          Canon EPCM
# lib32/libc.so.6               core/glibc
# lib32/libm.so.6               core/glibc
# lib32/libpthread.so.0         core/glibc
# lib32/librt.so.1              core/glibc
# lib/libc3pl.so                Canon

# lib32/libufr2filter.so        Canon UFR II Filter
# lib32/libcanonufr2.so         Canon UFR II
# lib32/libEnoJBIG.so.1.0.0     Canon JBIG
# lib32/libcanon_slim.so.1.0.0  Canon Slim
# lib32/libxml2.so.2            libxml2
# lib32/libEnoJPEG.so.1.0.0     Canon JPEG
# lib32/libicuuc.so.60          icu
# lib32/libz.so.1               core/zlib
# lib32/libicudata.so.60        Canon icu
# lib32/libstdc++.so.6          core/gcc-libs
# lib32/libgcc_s.so.1           core/gcc-libs

set -u
pkgname='cndrvcups-lb-bin'
#pkgver='3.00'; _commonver='3.10'; _dl0='0'; _dl1='0100003440'; _dl2='09'; _co='us' # http://gdlp01.c-wss.com/gds/0/0100003440/09/Linux_UFRII_PrinterDriver_V300_us_EN.tar.gz
#pkgver='3.00'; _commonver='3.10'; _dl0='8'; _dl1='0100002708'; _dl2='12'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/12/Linux_UFRII_PrinterDriver_V300_uk_EN.tar.gz 3d4210670e5844d118c5350643b046e9126726eadca4d0f5d2b9c904133e956d
#pkgver='3.10'; _commonver='3.40'; _dl0='0'; _dl1='0100003440'; _dl2='10'; _co='us' # http://gdlp01.c-wss.com/gds/0/0100003440/10/Linux_UFRII_PrinterDriver_V310_us_EN.tar.gz
#pkgver='3.10'; _commonver='3.40'; _dl0='0'; _dl1='0100003440'; _dl2='10'; _co='uk'
#pkgver='3.20'; _commonver='3.60'; _dl0='8'; _dl1='0100002708'; _dl2='14'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/14/Linux_UFRII_PrinterDriver_V320_uk_EN.tar.gz b28bc2b460aeddcb7800983d2fad8c29ea6efcc95ad767a78fe6c25d0956f242
#pkgver='3.30'; _commonver='3.70'; _dl0='8'; _dl1='0100002708'; _dl2='15'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/15/Linux_UFRII_PrinterDriver_V330_uk_EN.tar.gz df669767927a8e17faefe72b4a2c259cd944162b5ed046d44dedbbdb943cf756
#pkgver='3.31'; _commonver='3.71'; _dl0='8'; _dl1='0100007658'; _dl2='03'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/16/linux-UFRII-drv-v331-uken.tar.gz c1211cbe27034847284541fcc613b86ccfe99418a6a2cbb4589b99ffe1af4645
pkgver='3.40'; _commonver='3.80'; _dl0='8'; _dl1='0100002708'; _dl2='17'; _co='uk' # http://gdlp01.c-wss.com/gds/8/0100002708/17/linux-UFRII-drv-v340-uken.tar.gz fb3701f564f987126a9a3d03a163951f3182d6f7d626530a6767cb1f996fa203
_pkgver="${pkgver}"
pkgrel='2'
pkgdesc='CUPS Canon UFR II LT driver for imageCLASS D LBP i-SENSYS MF imagePRESS iPR imageRUNNER iR ADVANCE iR-ADV FAX color copiers and printers, does not require PCL/PXL or PS dealer LMS license'
# Not UFR II: PRO PC-D
# UFR II but not included: Laser Shot
arch=('i686' 'x86_64')
url='http://support-asia.canon-asia.com/contents/ASIA/EN/0100270810.html'
license=('custom')
depends=('gcc-libs' 'libglade' 'glib2' 'gtk2' 'libxml2' 'libcups' 'libpng12' 'zlib')
depends_x86_64=("${depends[@]/#/lib32-}")
makedepends=('gzip')
replaces=('canon-ufr')
case "${_opt_use_other}" in
0)
  conflicts=('cndrvcups-common-lb' 'cndrvcups-lb')
  provides=("cndrvcups-lb=${_pkgver}")
  provides=("cndrvcups-common-lb=${_commonver}")
  ;;
1)
  depends+=("cndrvcups-common-lb=${_commonver}")
  conflicts=('cndrvcups-lb')
  provides=("cndrvcups-lb=${_pkgver}")
  ;;
2)
  conflicts=('cndrvcups-common-lb')
  provides=("cndrvcups-common-lb=${_commonver}")
  ;;
esac
if [ "${_opt_altver}" -ge 2 ]; then
  makedepends+=('bsdiff')
fi
options=('!strip')
if [ "$(vercmp "${_pkgver}" '3.30')" -le 0 ]; then
  _srcdir=("Linux_UFRII_PrinterDriver_V${pkgver//./}_${_co}_EN")
else
  _srcdir=("linux-UFRII-drv-v${pkgver//./}-${_co}en")
fi
source=("http://gdlp01.c-wss.com/gds/${_dl0}/${_dl1}/${_dl2}/${_srcdir}.tar.gz")
if [ "${_opt_altver}" -ne 0 ]; then
  _pkgverA='3.20'
  pkgver="${_pkgver}.r${_pkgverA}"
  if [ "${_opt_altver}" -ge 1 ] && [ "${_opt_altver}" -le 2 ]; then
    _coA='uk'
    _altversrc="Linux_UFRII_PrinterDriver_V${_pkgverA//./}_${_coA}_EN"
    source+=("file://${_altversrc}.tar.gz")
  fi
fi
if [ "${_opt_altver}" -eq 3 ]; then
  source+=("patch.RPM.cnpkmoduleufr2.${_pkgver}-${_pkgverA}.bspatch" "patch.Debian.cnpkmoduleufr2.${_pkgver}-${_pkgverA}.bspatch")
fi
if [ "${_opt_debug_cnpkmoduleufr2}" -ne 0 ]; then
  source+=(
    #'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.25-1-x86_64.pkg.tar.xz'
    #'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.24-2-x86_64.pkg.tar.xz'
    'https://archive.archlinux.org/packages/l/lib32-glibc/lib32-glibc-2.23-5-x86_64.pkg.tar.xz'
  )
fi
sha256sums=('fb3701f564f987126a9a3d03a163951f3182d6f7d626530a6767cb1f996fa203'
            '21c0e211db2c96422fc9084a1215c880f8d53a2c8c17ccb6458d13573e002268'
            '240056a59084e9426a6e8e5b8a07734785b7f3983dc26c74127463e1a6c16e4e')
#PKGEXT='.tar.gz'

package() {
  set -u
  cd "${pkgdir}"
  if [ "${_opt_32bitonly}" -ne 0 ]; then
    local CARCH='i686'
  fi
  declare -A _archd=([i686]='32-bit_Driver' [x86_64]='64-bit_Driver')
  local _archrpme=('deb' 'rpm')
  local _archrpmf=('Debian' 'RPM')
  install -d "usr/share/licenses/${pkgname}"
  if [ "${_opt_RPM}" -ne 0 ]; then
    declare -A _archf=([i686]='i386' [x86_64]='x86_64')
    local _p1='-'
    local _p2='.'
  else
    declare -A _archf=([i686]='i386' [x86_64]='amd64')
    local _p1='_'
    local _p2='_'
  fi
  local _cncom="cndrvcups-common${_p1}${_commonver}-1${_p2}${_archf[${CARCH}]}"
  local _cnufr="cndrvcups-ufr2-${_co}${_p1}${_pkgver}-1${_p2}${_archf[${CARCH}]}"
  local _arpat="patch.${_archrpmf[${_opt_RPM}]}.cnpkmoduleufr2.${_pkgver}-${_pkgverA}.bspatch"
  if [ "${_opt_RPM}" -ne 0 ]; then
    if [ "${_opt_use_other}" -ne 1 ]; then
      bsdtar -xf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cncom}.${_archrpme[${_opt_RPM}]}"
      mv "usr/share/doc/cndrvcups-common-${_commonver}"/*.txt "usr/share/licenses/${pkgname}/"
      rmdir "usr/share/doc/cndrvcups-common-${_commonver}"
    fi
    if [ "${_opt_use_other}" -ne 2 ]; then
      bsdtar -xf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufr}.${_archrpme[${_opt_RPM}]}"
      mv "usr/share/doc/cndrvcups-ufr2-${_co}-${_pkgver}"/*.txt "usr/share/licenses/${pkgname}/"
    fi
    cp -dprx 'usr/local/.' 'usr/'
    rm -r 'usr/local'

    if [ "${_opt_altver}" -ge 1 ] && [ "${_opt_altver}" -le 2 ]; then
      if [ "${_opt_altver}" -eq 2 ]; then
        mv 'usr/bin/cnpkmoduleufr2'{,.old}
      fi
      set +u; msg2 "Using alternate ${_altversrc}"; set -u
      local _cnufrA="cndrvcups-ufr2-${_coA}${_p1}${_pkgverA}-1${_p2}${_archf[${CARCH}]}"
      bsdtar -xf "${srcdir}/${_altversrc}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufrA}.${_archrpme[${_opt_RPM}]}" 'usr/bin/cnpkmoduleufr2'
      if [ "${_opt_altver}" -eq 2 ]; then
        bsdiff 'usr/bin/cnpkmoduleufr2'{.old,} "${startdir}/${_arpat}"
        rm 'usr/bin/cnpkmoduleufr2.old'
      fi
    fi

    if [ "${_opt_32bitonly}" -eq 0 ]; then
      mv 'usr/lib' 'usr/lib32'
      mv 'usr/lib64' 'usr/lib'
      # This 32 bit lib is only searched for in /usr/lib
      ln -s '../lib32/libc3pl.so' -t 'usr/lib'
    else
      mkdir 'usr/lib32'
      mv 'usr/lib'/*.so* 'usr/lib'/*.a 'usr/lib32'
    fi
  else
    if [ "${_opt_use_other}" -ne 1 ]; then
      bsdtar -xvf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cncom}.${_archrpme[${_opt_RPM}]}"
      bsdtar -xf 'data.tar.gz'
      mv 'usr/share/doc/cndrvcups-common'/*.txt.gz "usr/share/licenses/${pkgname}/"
    fi
    if [ "${_opt_use_other}" -ne 2 ]; then
      bsdtar -xvf "${srcdir}/${_srcdir}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufr}.${_archrpme[${_opt_RPM}]}"
      bsdtar -xf 'data.tar.gz'
      mv "usr/share/doc/cndrvcups-ufr2-${_co}"/*.txt.gz "usr/share/licenses/${pkgname}/"
    fi
    chmod 777 'etc/cngplp'/*/

    if [ "${_opt_altver}" -ne 0 ]; then
      if [ "${_opt_altver}" -eq 2 ]; then
        mv 'usr/bin/cnpkmoduleufr2'{,.old}
      fi
      set +u; msg2 "Using alternate ${_altversrc}"; set -u
      local _cnufrA="cndrvcups-ufr2-${_coA}${_p1}${_pkgverA}-1${_p2}${_archf[${CARCH}]}"
      bsdtar -xvf "${srcdir}/${_altversrc}/${_archd[${CARCH}]}/${_archrpmf[${_opt_RPM}]}/${_cnufrA}.${_archrpme[${_opt_RPM}]}"
      bsdtar -xf 'data.tar.gz' 'usr/bin/cnpkmoduleufr2'
      if [ "${_opt_altver}" -eq 2 ]; then
        bsdiff 'usr/bin/cnpkmoduleufr2'{.old,} "${startdir}/${_arpat}"
        rm 'usr/bin/cnpkmoduleufr2.old'
      fi
    fi
    rm 'data.tar.gz' 'control.tar.gz' 'debian-binary'

    # move the 32 bit libs into lib32
    if pushd 'usr/lib/' > /dev/null; then
      local _lib32=()
      local _f _t
      for _f in *.so*; do
        _t="$(file -L "${_f}")"
        if [ "${_t//32-bit/}" != "${_t}" ]; then
          _lib32+=("${_f}")
        fi
      done
      mkdir '../lib32'
      mv "${_lib32[@]}" '../lib32/'
      if [ "${_opt_32bitonly}" -ne 0 ]; then
        mv *.a '../lib32/'
      fi
      # This 32 bit lib is only searched for in /usr/lib
      ln -s '../lib32/libc3pl.so'
      popd > /dev/null
    fi
  fi

  if [ "${_opt_debug_pstoufr2cpca}" -ne 0 ]; then
    if [ "${_opt_use_other}" -ne 2 ]; then
      mv 'usr/lib/cups/filter/pstoufr2cpca'{,.arch}
    fi
    install -Dm755 <(cat << EOF
#!/bin/bash
umask 000
set > "/tmp/pstoufr2cpca.\$\$.env"
printf '%s' "\$0" > "/tmp/pstoufr2cpca.\$\$.cmd"
printf ' %q' "\$@" >> "/tmp/pstoufr2cpca.\$\$.cmd"
echo "" >> "/tmp/pstoufr2cpca.\$\$.cmd"
cat > "/tmp/pstoufr2cpca.\$\$.prn"
#LD_PRELOAD=/usr/lib32/${pkgname}/ \\\\
<"/tmp/pstoufr2cpca.\$\$.prn" \
strace -f -o "/tmp/pstoufr2cpca.\$\$.strace" '/usr/lib/cups/filter/pstoufr2cpca.arch' "\$@" 2>"/tmp/pstoufr2cpca.\$\$.debug" | tee "/tmp/pstoufr2cpca.\$\$.ufr"
EOF
    ) 'usr/lib/cups/filter/pstoufr2cpca'
    if [ "${_opt_use_other}" -eq 2 ]; then
      mv 'usr/lib/cups/filter/pstoufr2cpca'{,.new}
      install -m744 <(cat << EOF
#!/bin/bash

if [ "\$(stat -c '%s' 'pstoufr2cpca')" -ge 5000 ]; then
  mv '/usr/lib/cups/filter/pstoufr2cpca'{,.arch}
fi
cp '/usr/lib/cups/filter/pstoufr2cpca'{.new,}
echo 'Filter debugger installed. Watch /tmp for print files.'
EOF
      ) 'usr/lib/cups/filter/pstoufr2cpca.inst.sh'
    fi
  fi

  if [ "${_opt_debug_cnpkmoduleufr2}" -ne 0 ]; then
    install -d "${pkgdir}/usr/lib32/${pkgname}/"
    mv "${srcdir}/usr/lib32"/* "${pkgdir}/usr/lib32/${pkgname}/"
    mv 'usr/bin/cnpkmoduleufr2'{,.arch}
    install -Dm755 <(cat << EOF
#!/bin/bash
# These LD_ don't work because cnpkmoduleufr2 is setuid
#LD_PRELOAD=/usr/lib32/${pkgname}/libc.so.6
LD_LIBRARY_PATH=/usr/lib32/{pkgname}/ '/usr/bin/cnpkmoduleufr2.arch' "\$@"
EOF
    ) 'usr/bin/cnpkmoduleufr2'
  fi

  # Let's put the filter where they look first
  ln -s '/usr/bin/c3pldrv' -t 'usr/lib/cups/filter/'

  if [ "${_opt_altver}" -eq 3 ]; then
    set +u; msg2 "Patching alternate to ${_pkgverA}"; set -u
    bspatch 'usr/bin/cnpkmoduleufr2'{,.new} "${srcdir}/${_arpat}"
    chmod 755 'usr/bin/cnpkmoduleufr2.new'
    mv 'usr/bin/cnpkmoduleufr2'{.new,}
  fi

  # grep -he '^*ModelName:' 'usr/share/cups/model'/*.ppd > "${startdir}/models.${_pkgver}.txt"

  gzip 'usr/share/cups/model'/*.ppd

  set +u
}
set +u
