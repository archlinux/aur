# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Arthur Zamarin arthurzam gmail
# Forked from eclipse PKGBUILD
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Pablo Nicolas Diaz <pablonicolas.diaz@gmail.com>
# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>

# TODO: Integrate with other eclipse packages
#   move from /usr/share to /usr/lib
#   remove items from common and other libs
#   remove conflicts
#   separate parts into split packages
#   Eclipse packages are in too much turmoil to do this
# TODO: Figure out dbf imports, dbf-jdbc
#   http://www.csv-jdbc.com/stels_dbf_jdbc.htm

# To get started, File New Other, Business Intelligence and Reporting Tools, Report

set -u
_internal_pkgver='R'
_package='reporting'
pkgname="eclipse-${_package}"
pkgver='4.7.0'; _color='oxygen'
pkgrel='1'
pkgdesc='an IDE for Java and other languages - JEE + BIRT package'
arch=('i686' 'x86_64')
url='https://projects.eclipse.org/projects/birt'
license=('EPL/1.1')
depends=('java-environment>=6' 'gtk2>=2.16.1' 'xulrunner>=1.9.0.10')
#provides=("eclipse=${pkgver}" 'eclipse-wtp-wst=3.1.1' 'eclipse-wtp=3.1.1' 'eclipse-dtp=1.7.2' 'eclipse-emf=2.5.0')
#conflicts=('eclipse')
options=('!strip')
install='eclipse.install'
_verwatch=("${url}" '.*href="/projects/birt/releases/\([^"]\+\)".*' 'f')
source=('http://svgicons.o7a.net/unofficial/eclipse.svg')
source_x86_64=("http://mirror.cc.columbia.edu/pub/software/eclipse/|technology/epp/downloads/release/${_color}/${_internal_pkgver}/eclipse-${_package}-${_color}-${_internal_pkgver}-linux-gtk-x86_64.tar.gz")
source_i686=("${source_x86_64[@]/-x86_64/}")
sha256sums=('daac56ff0f7e4d2da534516cdd07b0f0a9dab85cdba7c9df8bb7bbbfa7e937a2')
sha256sums_i686=('11207ba2f19262a0cd7bfbe871142446aa2e6bee37e0084fbeaa6ca7db217ca1')
sha256sums_x86_64=('6d8f676d5b761d6c49a72916562624aaf7ca72fb56aec7b4fe5d3149e6af7c85')
PKGEXT='.pkg.tar.gz' # xz is only saves 10MB for 3 minutes extra compress time

# https://gcc.gnu.org/mirrors.html
_setmirror() {
  local _cmd="${BASH_SOURCE[*]}" # want [*] not [@]
  local _lang="${LANG:-}" # mksrcinfo removes LANG
  if [ "${_cmd/makepkg/}" != "${_cmd}" ] && [ ! -z "${_lang}" ]; then
    local _mirrors=()
    _lang="${_lang%%\.*}"
    _lang="${_lang##*_}"
    case "${_lang}" in
    'AU') _mirrors+=('http://mirror.internode.on.net/pub/eclipse/');; # 1221
    'BR') _mirrors+=('http://eclipse.c3sl.ufpr.br/');; # 576
    'CA') _mirrors+=('http://mirror.csclub.uwaterloo.ca/eclipse/');; # 492
    'CH') _mirrors+=('http://mirror.switch.ch/eclipse/');; # 63 Switzerland, should this be CH*
    'CN') _mirrors+=(
      'http://mirrors.opencas.org/eclipse/' # 1252
      'http://mirrors.ustc.edu.cn/eclipse/' # 1093
      'http://mirrors.neusoft.edu.cn/eclipse/' # 1142
      );;
    'CY') _mirrors+=('http://mirror.library.ucy.ac.cy/eclipse/');; # 1255
    'CZ') _mirrors+=(
      'http://mirror.dkm.cz/eclipse/' # 1099
      'http://mirrors.nic.cz/eclipse/' # 1196
      );;
    'FR') _mirrors+=('http://mirror.ibcp.fr/pub/eclipse/');; # 1208
    'DE') _mirrors+=(
      'http://ftp.halifax.rwth-aachen.de/eclipse/' # 1045
      'http://ftp-stud.fht-esslingen.de/pub/Mirrors/eclipse/' # 17
      'http://artfiles.org/eclipse.org/' # 274
      'http://ftp.fau.de/eclipse/' # 1190
      'http://eclipsemirror.itemis.de/eclipse/' # 1253
      );;
    'HR') _mirrors+=('http://mirrors.uniri.hr/eclipse/');; # 1188
    'IE') _mirrors+=('http://ftp.heanet.ie/pub/eclipse/');; # 491
    'IT') _mirrors+=('http://eclipse.mirror.garr.it/mirrors/eclipse/');; # 1039
    'KR') _mirrors+=( # should we add KP?
      'http://ftp.daumkakao.com/eclipse/' # 1211
      'http://ftp.kaist.ac.kr/eclipse/' # 466
      );;
    'JP') _mirrors+=(
      'http://ftp.jaist.ac.jp/pub/eclipse/' # 105
      'http://ftp.yz.yamagata-u.ac.jp/pub/eclipse/' # 1248
      );;
    'NC') _mirrors+=('http://mirror.lagoon.nc/pub/eclipse/');; # 1210
    'NL') _mirrors+=(
      'http://ftp.snt.utwente.nl/pub/software/eclipse/' # 1186
      'http://eclipse.mirror.wearetriple.com/' # 1250
      );;
    'PH') _mirrors+=('http://mirror.rise.ph/eclipse/');; # 1222
    'PL') _mirrors+=('http://mirror.onet.pl/pub/mirrors/eclipse/');; # 1215
    'RU') _mirrors+=('http://mirror.tspu.ru/eclipse/');; # 1029
    'SE') _mirrors+=('http://ftp.acc.umu.se/mirror/eclipse.org/');; # 1156
    'UK') _mirrors+=('http://www.mirrorservice.org/sites/download.eclipse.org/eclipseMirror/');; # 96
    'US') _mirrors+=(
      'http://ftp.osuosl.org/pub/eclipse/' # 272
      'http://mirror.cc.vt.edu/pub/eclipse/' # 504
      'http://ftp.ussg.iu.edu/eclipse/' # 346
      'http://mirrors.xmission.com/eclipse/' # 518
      'http://mirror.cc.columbia.edu/pub/software/eclipse/' # 454
      'http://mirror.math.princeton.edu/pub/eclipse/' # 1249
      );;
    'TW') _mirrors+=(
      'http://ftp.yzu.edu.tw/eclipse/' # 1207
      'http://eclipse.stu.edu.tw/' # 75
      'http://eclipse.stu.edu.tw/' # 448
      );;
    'VN') _mirrors+=('http://mirror.downloadvn.com/eclipse/');; # 1235
    'ZA') _mirrors+=('http://mirror.ufs.ac.za/eclipse/');; # 1068
    #*) _mirrors+=('http://mirror.cc.columbia.edu/pub/software/eclipse/');; # 1
    esac
    local _mc="${#_mirrors[@]}"
    if [ "${_mc}" -ne 0 ]; then
      _mc=$((${RANDOM} % ${_mc}))
      _mc="${_mirrors[${_mc}]%/}"
      source_x86_64[0]="${_mc}/${source_x86_64[0]##*|}"
      source_i686[0]="${_mc}/${source_i686[0]##*|}"
      set +u
      msg "Alternate mirror: ${_mc}"
      set -u
    fi
  fi
}
if [ "${source_x86_64[0]//|/}" != "${source_x86_64[0]}" ]; then
  _setmirror
  source_x86_64[0]="${source_x86_64[0]//|/\/}"
  source_i686[0]="${source_i686[0]//|/\/}"
fi
unset -f _setmirror

pkgver() {
  set -u
  cd 'eclipse'
  sed -n -e 's:^eclipse.buildId=\(.*\)\.I.*$:\1:p' 'configuration/config.ini'
  set +u
}

prepare() {
  set -u
  # cd 'eclipse'

  # patch to increase default memory limits
  # patch -Np0 -i "${srcdir}/eclipse.ini.patch"
  set +u
}

package() {
  set -u
  local _eclipse='usr/share/eclipsereporting'
  # install eclipse
  install -d "${pkgdir}/${_eclipse}"
  mv 'eclipse' "${pkgdir}/${_eclipse}/"
  _eclipse="${_eclipse}/eclipse"

  # install misc
  install -Dm755 <(cat << EOF
#!/usr/bin/sh
export ECLIPSE_HOME='/${_eclipse}'
#export GDK_NATIVE_WINDOWS=true
\${ECLIPSE_HOME}/eclipse $@
EOF
  ) "${pkgdir}/usr/bin/eclipse"

  install -Dm644 <(cat << EOF
[Desktop Entry]
Name=Eclipse Reporting (BIRT)
Comment=A Java Development Environment
Icon=eclipse
Exec=/usr/bin/eclipse
Terminal=false
Type=Application
Categories=GNOME;Application;Development;
StartupNotify=true
EOF
  ) "${pkgdir}/usr/share/applications/eclipse.desktop"

  install -d "${pkgdir}/usr/share/icons/hicolor"/{16x16,32x32,48x48}/apps
  shopt -s failglob
  local _png
  cd "${pkgdir}"
  #_png=("usr/lib/eclipse/plugins/org.eclipse.platform_${pkgver}."*/eclipse.png); test "${#_png}" -eq 1
  #ln -sf "/${_png}"   "${pkgdir}/usr/share/icons/hicolor/16x16/apps/eclipse.png"
  _png=("${_eclipse}/plugins/org.eclipse.platform_${pkgver}."*/eclipse32.png); test "${#_png[@]}" -eq 1
  ln -s "/${_png}" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/eclipse.png"
  _png=("${_eclipse}/plugins/org.eclipse.platform_${pkgver}."*/eclipse48.png); test "${#_png[@]}" -eq 1
  ln -s "/${_png}" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/eclipse.png"
  shopt -u failglob

  install -Dpm644 "${srcdir}/eclipse.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/eclipse.svg"
  set +u
}
set +u
