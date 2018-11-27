# Maintainer: Christos Nouskas <nous at archlinux dot us>
# PKGBUILD assembled from linux-pf and linux-lts
# Some lines from linux-bfs and linux-ck
# Credits to respective maintainers

pkgbase=linux-pf-lts
_major=4
_minor=9
_patchlevel=140
_pfpatchlevel=22
#_subversion=1
_basekernel=${_major}.${_minor}
_srcname=linux-${_basekernel}
_pfrel=6
pkgrel=1
_kernelname=-pf
#_pfpatchhome="http://pf.natalenko.name/sources/${_basekernel}/"
#_pfpatchname="patch-${_basekernel}${_kernelname}${_pfrel}"
_pfpatchhome="https://github.com/pfactum/pf-kernel/compare/"
_pfpatchname=v${_basekernel}...v${_basekernel}-pf${_pfrel}.diff

### PATCH AND BUILD OPTIONS

_NUMA_off=yes        # Disable NUMA in kernel config

# DETAILS FOR _NUMA_off=yes
# Since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
# see, https://bugs.archlinux.org/task/31187

# Set to 'y' to enable AUFS
_AUFS=y

####
_CPUSUFFIXES_KBUILD=(CORE2 K7 K8 K10 BARCELONA BOBCAT BULLDOZER PILEDRIVER PSC ATOM PENTIUMII PENTIUMIII PENTIUMM PENTIUM4 COREI7 COREI7AVX COREAVXI COREAVX2)
_CPUSUFFIXES=(core2 k7 k8 k10 barcelona bobcat bulldozer piledriver psc atom p2 p3 pm p4 nehalem sandybridge ivybridge haswell)

###

pkgname=('linux-pf-lts' 'linux-pf-lts-headers')
pkgver=${_basekernel}.${_patchlevel}
arch=('i686' 'x86_64')
url="http://pf.natalenko.name/"
license=('GPL2')
makedepends=('git' 'xmlto' 'docbook-xsl' 'kmod' 'inetutils' 'bc')
options=('!strip')
# That voodoo that you do
_incr=($(for i in $(seq ${_pfpatchlevel} $((_patchlevel-1)) ); do echo https://www.kernel.org/pub/linux/kernel/v${_major}.x/incr/patch-${_major}.${_minor}.$i-$((i+1)).xz; done))

source=(https://www.kernel.org/pub/linux/kernel/v${_major}.x/${_srcname}.tar.{xz,sign}
        # the main kernel config files
        'config' 'config.x86_64'
        # pacman hook for initramfs regeneration
        '90-linux.hook'
        # standard config files for mkinitcpio ramdisk
        "$pkgbase.preset"
        # pacman hook for initramfs regeneration
        '90-linux.hook'
        'logo_linux_clut224.ppm.bz2'        #\
        'logo_linux_mono.pbm.bz2'           #-> the Arch Linux boot logos
        'logo_linux_vga16.ppm.bz2'          #/
        "${_pfpatchhome}${_pfpatchname}"    # the -pf patchset
        ${_incr[@]})                        # the incremental kernel patches
sha256sums=('029098dcffab74875e086ae970e3828456838da6e0ba22ce3f64ef764f3d7f1a'
            'SKIP'
            '733b092bbcbb2d07dd891c77eb257104c04f21794ccec07af20b962ff81999af'
            '377dd6e6675ec34a81bad6f3d651e23dd06b459e09320d6e6bbf4ac5507359c2'
            '834bd254b56ab71d73f59b3221f056c72f559553c04718e350ab2a3e2991afe0'
            '1f036f7464da54ae510630f0edb69faa115287f86d9f17641197ffda8cfd49e0'
            '834bd254b56ab71d73f59b3221f056c72f559553c04718e350ab2a3e2991afe0'
            '03ed4eb4a35d42ae6beaaa5e6fdbada4244ed6c343944bba6462defaa6fed0bf'
            '51ea665cfec42d9f9c7796af2b060b7edbdeb367e42811f8c02667ad729f6b19'
            '9e1e81d80afac6f316e53947e1b081017090081cd30e6c4c473420b77af4b52b'
            '7c50bd18693db82d0c04ab3ef2a8dba90af9a433072bac1448483128aabccb94'
            '5bf7ecb7044b493206683ed8341e3ba0d4e1aa93a9266c5db631248a4f2090eb'
            '3833b9bf88031adcfadea5ba5a4b36a2f4a9993e3649a5140d3b9b14584e1f78'
            '0ca4aacb2bc688b3101a1e67e2d0f5258bb4b1c4ca12e89fa078aa11f31b89a6'
            '50c9abe32ac6bcf0fbbb29c618cc98b0479233d28f8f94d663db9da7d63cc094'
            '8474d2fbbbac02fe75c91e9b4fb7b6c3fe3ae26405f86bdac19325908d73f042'
            '0735a9afe005f8a20d3e2b1f8970c9c47aa1aa1128b7c4bf0c83f0503ca21bb7'
            'db633ae8a13c6f8f8c69f26154266c2b801f6ecae0ea445b217378cdd76a4470'
            '0e3491b02ed6e264c8150a43586a633c2b890a699843a27aa546c2766d132352'
            '6c6fcfdac62400a614059be2651228a498455968d84022d99f4a6112ae73f36e'
            '9e25a7721f9c1fd17f77f7adced8f91be0d2f2c90ccdf65f419a6cec6dc6a99d'
            'e224496f1afc1d222ee38e95565165b5c0cca69a70681c907aa0d1cbf776b17d'
            '06006d6940a3a27a5ac7f51f8aaa10a6d63045352f1e72427cbab3ce0dee9542'
            'f596b21d005c6e9f65320933012baee2482ff0d21d40c2166dc95bfb5c3d4796'
            '5578d379051ba518c6e52aa673099fa0969a072a6546041f505bf73f6edc0e1a'
            'f61fccd018f8cc7bd06b4b3561ccff347c0742adaf9ef94949f1c55b5f55af73'
            '41d0e8710e4a731ff24ba2a08fc49ff6b0b418fa16cbd3fede7e1887b4d2e57e'
            '749804370d8e89ce42605c6e03863181e40c0af9684f96dd4f3a1617956241a4'
            'e8f06216649295345d01f20fe32a95b99bd7a1d34e2efab175518df41f46747e'
            'a8ab5da608cd10c81b1e79ff6de484972a064b18d7f37fad3035c1c7fe3ff425'
            '5b27b346324052df15d0cb20e5101335c81d7a166df14217f91cf1f6d26aa335'
            '5d035459919d8c544d0016be6972e2d4eff5c7c7b7f268ae1e5abfdab94caf87'
            'a17c21ceadea9954daa3f55cda8fbe8df9abcdaa6575006f44cd20c69cd870c6'
            '0cbed0cb91f16f4cdbb3c98d43f54a04f4e4c311d90bd5df84cfb5c89e26c5fe'
            'ad4a8d4007ce1966bc2d86da4da732f403539c0a8045f2c51802faf1cfb7a001'
            '9e0b4c4bd7021e987b35ee4f4d947ca4b9c11463f04f273109c86d8be0b1f2cc'
            '60779a56891455f3b73524c1a33f8fca0e6e6f0d60f1a81cb85c2f7b19b1cbe2'
            '7749ae1978889382af8de9050a202c65654dc38dd899a1cd2fa43919a2c9f2cd'
            '9b847af46635dbb200a55aa89b951a133a436d776c906f6908addf5c800130cc'
            '20c1ecc3321328ebf251e8a7c426b385a6af6f2eb04f2b90e567d3f4683ac4b1'
            '9ce4c87707cfe8e3a7f123ecafda72fd2f14a89161381db00366897cdea52154'
            '27edfaa198cf2ac5909e45ca9ea8e5a76dd9c4c124308d3f15e755236f7fa538'
            '0c89b0d4728a289f6d744b68ccdd30a1346486ff5a673b28b007f5817ac7e007'
            '27b07d8188614940b34a57673d119488b6943f9dc31458a0e0437b008ca94125'
            'bf12b7d994948ae21be887ef82e904ae7889e274b9e56423f6cee5983f585bed'
            '393639742cc19a996b525675fab30b335875b3d91a544eb1fdf929896944f6c6'
            'de0cc3c9a497e7df2d44205d55234fa91a50f61d1d45d716a26c4f1cded71d5b'
            '655e816cce1968fdf5eafa2f4b900fb23f1f6d51f61119eff1d86252c67ce109'
            '02a81f3478eab8c2834287a1aedd4e7f62b3d2a341c31bbe64fda432efd13905'
            '7e9756508de30a0a787b8aa7dbd50b89e19d0b05a57bb316c05276e083502dad'
            '65a165e732dc33f8b0b3e077d7f0dbae419a28b3142b3fc2f717f701a6785f80'
            '4c211745d210ab044ec9b4f0b1f496e32efd3efc4176adc6992642335814ff6f'
            '5f65e020f7211097d29e2b4879b8c4df334d1a504e6b451ac045a936b3b3583d'
            'ba531b62b547d5cc7ff815d6a67cb2a2b5858948731445fbf45c835396d6634e'
            'b2d556facb14a105dbf2c9455eaffca20f0d33b01e287c2bdd2abd9109fa35b2'
            'd7707daa13a8b82ae70162af484dc88565620b5a8a0c779fe8bc836765292acc'
            '5115daaf6b3a13c534d08f8ea9f074a70c76a893b1e0176eab8b48168ad06839'
            '268f23d0b1c37294ee258da72cc810a4505d4a5a119dd79108f7814dd91c695f'
            'c05925afe2d2423b25609c3e6c3016b0a8f2023024f0d9a7cfff37602e75c14a'
            '055b24f318f21c483398d46fc98843b2a5262cd34b318ff1a8331caf1750c40c'
            '3375f046747f00a28605b4836251dd5edc22f8b45ef1dc49e33dd31ab4f1d3da'
            '11d14ea4b1c94da81192c06d4b8e0310d5545614d91a0c04282e6ea7a7d68c0d'
            'db0eaabbc9ce2052397deb26fe6c072e804ab29514582c96add5664b795e6148'
            'f012b2fb5d9038b4295326b931a008a015ae916739dad2289b9de35634ada481'
            'ff10fbd50439b86a4ac036842531c39a55f3779f89fa2a38e0166cabd114d6a2'
            'f2eb68eb80dcf79cb7ffd9161580ed4dc69846c81a8d85519eaf97ee59718e56'
            'a0ea1caf612fc7afe5c11bbbf131eb2116ae539044b5f7d8acc0e61cae324c7b'
            'c43f2c351fa248c7b1f3e41eb1d5fb16b75870cbb44f9457b9f376e36698e6cf'
            '0864da76365efcca1b8b731215cf0fc785cd0888e6c5c42bebfeb70426e6016d'
            '6102c51dddcea3480de09f96bb93f0a49f3470da4c2e80d0d82ce97284e1e9a3'
            'cda5838f7f78f69a4e2a1eb6c08e1e3df955afa026caf3ceb0d7d465579ae9a5'
            'b3b8a6632c1173e17e8c8ed68fce22be165f660ccd5a4126731b0a028ca6d1d5'
            '5c2b7ba0c2dbb294fef9a8e5cabc4e2ef9bf38dae62ee5430bad8b5e8de71c53'
            '065eec3e8a53046e700fb601108ad3f98a586fb590b6fa4130494bba9ff20f18'
            'e8e1577cb41675d4fd070212e11d8d25e8da626761733e4106ea364767119b6c'
            '8f57e0ac37c8ba6254177df5e406e3872b3163e70c68aab4c684f1a5d8121e6c'
            '61a5c76c670c23cc82f426a94316c5b8ab4e7d8224ce383cd064d37f89e30ea6'
            '20a0033e5cc351c0943c67b5462f45d50f7e14d6de0b82aa36b7532a6608c8ab'
            'bab9bb8e689d7a6af4b7b688bed7f5ccaaa472916ccaa475b4e2fb9d2e2137e1'
            'dd933fd4552a6a2094ea1b1a4e1d8cc981937864dd60e8b9c77d5d7e22af2fb7'
            '0affd8ef87fcd42bdfca94b39a81b63edf6c49cbe8f37750e579eb1010a0b8d7'
            '7a5cfcdfccbb2cb0b07a02d08a210ba5ab07df4f2a2e21840ea68c20b34c3c38'
            '84ece4c2eaa3dbb288606149f38411d001b0b383560752f88b1d2f345f6e25be'
            '09edceefe0aba3008b3ce74326e5c6a376ffa7cbd6d6adb4d1652968ff1c10f9'
            '5cb9ceeed3cba64142f8e51b2eb78c2a50d58d58137267d06eacadf9d9450c41'
            '52483a28beae153c252681ec2334c4c3387d7d0aaeeac2ba2451d40282400ede'
            '3e21d62011df0fbde62226c37b6231edab979f2b2ef7742e1428e6bddad65da0'
            '8d5747fd1735e25ed15fd686458bb08e62dce928234dd2d0fb4e648ad2f11ec3'
            'dc928662d7e6b150b282230621ce6e94ba91a3ff36be9f3a3829e302e507bac4'
            '2606fae62e5139717bb349ec50af1d05e840c99c0a3f27d8885fe8007f1a7046'
            'e140fafaba22d0bba40b49fa16a18dd66ddd2ef5f10c54ab5fbf9f45bcb58886'
            'e56793fa19f6a98bf61ea6678d339e403bc68e81794e4e5203f8cb790bb24234'
            '34f31aaf4cad298c29fd312a85c2f0b1088945d4d8d1a6c051857d22dc350a7e'
            'd03dbd65f69ed749518f40d0fad2ac83a81ee299b2992db80b08fb629ddfe2fd'
            '1a220d1bba7f168320ad01fb2a5f25576fb16a2b101bbfbf82f29f2156cfc51f'
            '3483c3557088e781dd30cf0393d9f78165bb079dd44e683889d2cfd495c68225'
            '9c2a312386021293d999d55e7f54244867f25e46759669d99a2e09a8b6c77e07'
            '0089ec677d00e0568b8752450d628fd9fbc40cf5caf4e3602b5184ffabf34d5c'
            '310979f45e65352cbab09577909b730d32b85ee557d440e7e7e4a693d41c8ba2'
            'c0162302b2eb912206ce49296bec577bede1c83f3612775c7d9d61e010977591'
            '889c0be6b667568c4aad100b5758466f1e21f3e77727d3558f94a40121ef340d'
            'e4d412430a95e0812b96d99595e50cc51b6c857eb305905d66bddffc45cb9cbb'
            '63e1d0d53c4f4a00b77c9a67af12e9c0e1eaa4b25b20be5a1fc645cf32f96eb9'
            '7f6da7baab4a36e8dc81b38fc65ebde0e05e2bcc4ae949bd108541f4f8d0c459'
            'c16aac87c0ec31244f9c4a39de2a3e4ef3de2d129d606208477aaa77dc620789'
            '3317e459579afa571903998c6e897b95d6ac58ae4c9b8b864956f3b696369e4b'
            '36c4728be1809312557ce2213cf9761d283cf828737340c87f05fad29f6daa27'
            'bdb55ade9f2a0cfb7c8dc20210fa267a92c773738a52076d7dcf7c271c95c1b7'
            '4335892bcc552007d0eaa8152e955ccfe92436941ebfb8c84f881faff537177f'
            'a5f415aeed66814441fd89ec968115cdcab98984dda34e985460067eb523e7c6'
            'bedc859ae73123362c8af42bff8a5582b567fb1fd35fa36098c508d0f0b65dbe'
            '271d7be74d0931b258fefde09269727c11033034cc87ab1823debe17c8c0cd77'
            '4606f8e8185a97462fadba12a656eb81bafc1bc99f52a0c4ca6519c1a92c8190'
            '2fd4ce2d236cb4c0eba4dc15c083b0ebfd5c7cf2e4ca170260eb1c586be8f0fb'
            '791f4dae9490edfec623ea750543c428729e8b8bcb432c95624b6b439fb32672'
            '04e29a02ffcf0f341fa9b410388bedfc69749ad1a1f161ed6f386fade5edda78'
            '97d6a6ff25935b647324306ba9fe26fce558c8d3a00d95492b27b394c6d1fa08'
            'e3afb20e22c1448a7210d7851d2da1eebe23296e0f51ce8adeecd63990398c96'
            '06f7c2034f6eb182a215f66ad29e5c069d1622abe6663c27edf26c29c982d9d5'
            'debb278dfda898544f470c77df59ff7e9e1ad39b453d07978c314b44e0821894'
            '8ce1d411c8a1af219d51ed606bff34824aa9cf94cff68cfeb3852c2f93c601d7'
            'a9afa2853caef46499bd43f908b9653da8b99dee9c16b8cddf90aa4177b0735c'
            'dc812cf8d112cebd766ebfa3dd0481962c84e7831cb9b2866f677dee03551bd9'
            'dac4ffce329fda7a4f8e4d038fddd2acebe14ad28b03792acc4826be06ff47bf'
            'c56bc60969300454ff066f44ceb072c09b10157a85cb8159939ef1911db6b15b'
            'c5116f3a115acc142bc8c86ba21c311b512e309a3105ac3f05c7d6c158ce05ba'
            'a5b4cc9696ea4cda9f24edad0553bd1d0d8a4465ab19840c6f308ddeecfb30fe'
            'bf5afb109661ff00c463d528681a0883a504c4eb335d3a8a5aa6073b3547617c'
            '55cb30ba244fd6497b9afdd4f81f5d7c8efaf2426d10e8edd2d20c5bce0db5ad')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds <torvalds@linux-foundation.org>
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman (Linux kernel stable release signing key) <greg@kroah.com>
             )

_aufs4git="https://github.com/sfjro/aufs4-standalone.git"
_aufs4name=aufs4-standalone

_kernelname=${pkgbase#linux}
# '

prepare() {
  cd "${srcdir}/${_srcname}"


  # This is for me, to test the PKGBUILD

  # Arch linux logo
  msg "Replacing penguins with arches"
  bzip2 -dk ${startdir}/logo_linux_*.bz2
  mv -f ${startdir}/logo_linux_*.p?m drivers/video/logo/

  msg "Applying pf-kernel patch"
  patch -Np1 < ${srcdir}/${_pfpatchname}

  if [[ ${_AUFS} = 'y' ]]; then
    msg "Fetching and applying aufs4 patches"
    git clone ${_aufs4git} ${_aufs4name}
    cd ${_aufs4name}
    git checkout origin/aufs${_basekernel} || _aufs4checkout=KRAKRA
    if [[ ${_aufs4checkout} = "KRAKRA" ]]; then
    echo
        msg "AUFS4 not yet ported to version ${_basekernel}!"
        msg "Skipping related patches."
    echo
    cd ..
     else
#        mkdir -p "${pkgdir}/usr/src/linux-${_kernver}/include"
#        mv include/linux/Kbuild "${pkgdir}/usr/src/linux-${_kernver}/include/"
    rm include/uapi/linux/Kbuild
    cd ..
    cp -a ${_aufs4name}/{Documentation,fs,include} ${srcdir}/linux-${_basekernel}/
    msg "Patching aufs4"
    for _patch in ${_aufs4name}/*.patch; do
        patch -Np1 -i ${_patch} || _aufs4fail=KRAKRA
        done
        if [[ ${_aufs4fail} = "KRAKRA" ]]; then
        echo
            msg "Not all aufs4 patches applied correctly. Ignore this if you won't use AUFS."
            msg "Otherwise, press CTRL-C now and fix manually"
            echo
        fi
     fi
  fi

  # Incremental patches
  for _incrpatch in "${srcdir}"/patch-${_basekernel}.??-??; do
    msg "Patching ${_incrpatch} -- Makefile fails are harmless"
    patch -Np1 -i "${_incrpatch}" || true
  done

  if [ "${CARCH}" = "x86_64" ]; then
    cat "${srcdir}/config.x86_64" > ./.config
  else
    cat "${srcdir}/config" > ./.config
  fi

#  if [ "${_kernelname}" != "" ]; then
#    sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"${_kernelname}\"|g" ./.config
#    sed -i "s|CONFIG_LOCALVERSION_AUTO=.*|CONFIG_LOCALVERSION_AUTO=n|" ./.config
#  fi

  # Set EXTRAVERSION to -pf
  #  sed -i "s/EXTRAVERSION = -${_pfrel}/EXTRAVERSION = ${_kernelname}/" Makefile
  sed -ri "s/^(EXTRAVERSION =).*/\1 ${_kernelname}/" Makefile

  # don't run depmod on 'make install'. We'll do this ourselves in packaging
  sed -i '2iexit 0' scripts/depmod.sh

  # If the following is set, stop right there. We only need the headers for
  # dependent drivers' compiling (nvidia, virtualbox etc)

  # disable NUMA since 99.9% of users do not have multiple CPUs but do have multiple cores in one CPU
  # see, https://bugs.archlinux.org/task/31187
  if [ -n "$_NUMA_off" ] && [ "${CARCH}" = "x86_64" ]; then
     sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
      -i -e '/CONFIG_AMD_NUMA=y/d' \
      -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
      -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
      -i -e '/# CONFIG_NUMA_EMU is not set/d' \
      -i -e '/CONFIG_NODES_SHIFT=6/d' \
      -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
      -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
      -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
  fi

  # get kernel version
#  make prepare
}

build() {
  cd "${srcdir}/${_srcname}"
  #----------------------------------------

  if [[ "$_BATCH" != "y" ]]; then        # for batch building
    echo
    echo "======================================================="
    msg "You might be prompted below for some config options"
    echo "======================================================="
    echo
    msg "Hit <Y> to use your running kernel's config"
    echo "    (needs IKCONFIG and IKCONFIG_PROC)"
    msg "Hit <L> to run 'make localmodconfig'"
    msg "Hit <N> (or just <ENTER>) to build an all-inclusive kernel like stock Arch linux-lts"
    echo "    (warning: it can take a looong time)"
    echo
    read answer
    shopt -s nocasematch
    if [[ "$answer" = "y" ]]; then
      if [[ -s /proc/config.gz ]]; then
    msg "Extracting config from /proc/config.gz..."
    zcat /proc/config.gz >| ./.config
      else
    msg "running 'sudo modprobe configs'"
    sudo modprobe configs
        if [[ -s /proc/config.gz ]]; then
      msg "Extracting config from /proc/config.gz..."
      zcat /proc/config.gz >| ./.config
    else
      msg "You kernel was not compiled with IKCONFIG_PROC."
      msg "Attempting to run /usr/bin/modprobed_db recall from modprobe_db..."
      if [ -e /usr/bin/modprobed_db ]; then
        sudo /usr/bin/modprobed_db recall
      else
        msg "modprobed_db not installed, running make localmodconfig instead..."
        make localmodconfig
      fi
        fi
      fi
    elif [[ "$answer" = "l" ]]; then
      # Copied from kernel26-ck's PKGBUILD
      msg "Attempting to run /usr/bin/reload_database with sudo from modprobe_db..."
      if [ -e /usr/bin/modprobed_db ]; then
    sudo /usr/bin/modprobed_db recall
      fi
      msg "Running 'make localmodconfig'..."
      make localmodconfig
    else
      msg "Using stock Arch linux-lts kernel .config (with BFS, BFQ and TuxOnIce enabled)."
    fi

    # Make some good use of MAKEFLAGS
    # MAKEFLAGS=`grep -v '#' /etc/makepkg.conf | grep MAKEFLAGS= | sed s/MAKEFLAGS=// | sed s/\"//g`

    # make prepare

    # Options for additional configuration
    echo
    msg "Kernel configuration options before build:"
    echo "    <M> make menuconfig (console menu)"
    echo "    <N> make nconfig (newer alternative to menuconfig)"
    echo "    <G> make gconfig (needs gtk)"
    echo "    <X> make xconfig (needs qt)"
    echo "    <O> make oldconfig"
    echo "    <L> make localyesconfig"
    echo "    <ENTER> to skip configuration and use stock Arch linux-lts defaults"
    read answer
    case "$answer" in
      m) make menuconfig
    ;;
      g) make gconfig
    ;;
      x) make xconfig
    ;;
      n) make nconfig
    ;;
      o) make oldconfig
      ;;
      l) make localyesconfig
    ;;
      default)
    ;;
    esac
    cp -v .config ${startdir}/config.local

    for _cpusuffix_kbuild in ${_CPUSUFFIXES_KBUILD[@]} ; do
      _egrepstring="${_egrepstring}M${_cpusuffix_kbuild}=y|"
    done

    CPU=$(egrep "${_egrepstring}CONFIG_GENERIC_CPU=y|M686=y|CONFIG_MNATIVE=y" ./.config)
    CPU=$(sed -e "s/CONFIG_M\(.*\)=y/\1/" <<<$CPU)
    CPU=$(sed -e "s/CONFIG_GENERIC_CPU=y/GENERIC/" <<<$CPU)
    CPU=$(sed -e "s/^686$/GENERIC/" <<<$CPU)
    cp -f .config ${startdir}/config.$CPU-$CARCH

  # Provide option to rename package according to CPU
    echo
    if [[ "$CPU" = "GENERIC" ]]; then
      msg "Hit <P>     :  to remove the patchlevel number from kernver"
      msg "               (i.e. linux-pf-lts-${_basekernel})"
      msg "Hit <ENTER> :  to include the patchlevel number in kernver (default)"
      msg "               (i.e. linux-pf-lts-${_basekernel}.${_patchlevel})"
      read answer
      shopt -s nocasematch
      if [[ "$answer" = "p" ]]; then
    export _SUBLEVEL=n
      fi
    else
      lcpu=$(tr '[:upper:]' '[:lower:]' <<< $CPU)
      lcpu=$(sed -e "s/entium//" <<<$lcpu)
      echo "=============================================================="
      msg "An non-generic CPU was selected for this kernel."
      echo
      msg "Hit <G>     :  to create a generic package named linux-pf-lts"
      msg "Hit <ENTER> :  to create a package named after the selected CPU"
      msg "               (linux-pf-lts-${lcpu} - recommended default)"
      echo
      msg "This option affects ONLY the package name. Whether or not the"
      msg "kernel is optimized was determined at the previous config step."
      echo "=============================================================="
      read answer
      shopt -s nocasematch
      if [[ "$answer" != "g" ]]; then
    export _PKGOPT=y
      fi
      msg "Hit <P>     :  to remove the patchlevel number from kernver"
      if [[ ${_PKGOPT} != "y" ]]; then
    msg "               (i.e. linux-pf-lts-${_basekernel})"
      else
    msg "               (i.e. linux-pf-lts-${lcpu}-${_basekernel})"
      fi
      msg "Hit <ENTER> :  to include the patchlevel number in kernver (default)"
      if [[ ${_PKGOPT} != "y" ]]; then
    msg "               (i.e. linux-pf-lts-${_basekernel}.${_patchlevel})"
      else
    msg "               (i.e. linux-pf-lts-${lcpu}-${_basekernel}.${_patchlevel})"
      fi
      read answer
      shopt -s nocasematch
      if [[ "$answer" = "p" ]]; then
    export _SUBLEVEL=n
      fi
    fi
  fi    # batch check ends here
  export CPU
  #----------------------------------------

  # Strip config of uneeded localversion
#  if [ "${_kernelname}" != "" ]; then
  sed -ri 's|(CONFIG_LOCALVERSION=).*|\1|g' ./.config
#  sed -ri 's|(CONFIG_LOCALVERSION_AUTO=).*|\1=n|' ./.config
#  fi

  # Remove the sublevel from Makefile, *if asked*.
  # This ensures our kernel version is always MAJ.MIN-pf
  # This way, minor kernel updates might not break external modules
  if [ "${_SUBLEVEL}" = "n" ]; then
     sed -ri 's|^(SUBLEVEL =).*|\1|' Makefile
  else
     sed -ri "s|^(SUBLEVEL =).*|\1 ${_patchlevel}|" Makefile
  fi

  # rewrite configuration
  yes "" | make config >/dev/null

  #cd "${srcdir}/${_srcname}"
  # Build
  # Want extreme and non-sensical optimization? Uncomment the following line!
  # export KCFLAGS="-march=native -Ofast"
  make ${MAKEFLAGS} LOCALVERSION= bzImage modules
}

_package() {
msg "Running package-${pkgbase}()"
 _pkgdesc="Linux kernel and modules with the pf-kernel patchset [-ck patch (BFS included), TuxOnIce, BFQ, UKSM] and aufs4. Long-term support."
 pkgdesc=${_pkgdesc}
 [ "${pkgbase}" = "linux" ] && groups=('base')
 depends=('coreutils' 'linux-firmware' 'kmod' 'mkinitcpio>=0.7')
 optdepends=('linux-lts-docs: Kernel hackers manual - HTML documentation that comes with the Linux kernel.'
        'crda: to set the correct wireless channels of your country'
        'pm-utils: utilities and scripts for suspend and hibernate power management'
        'tuxonice-userui: TuxOnIce userspace user interface'
        'hibernate-script: set of scripts for managing TuxOnIce, hibernation and suspend to RAM'
        'nvidia-pf: NVIDIA drivers for linux-pf-lts'
        'nvidia-beta-all: NVIDIA drivers for all installed kernels'
        'modprobed_db: Keeps track of EVERY kernel module that has ever been probed. Useful for make localmodconfig.')
 #provides=(${pkgbase}=${_basekernel} 'aufs4')    # for $pkgname-optimized
 provides=(${pkgbase}=${_basekernel} linux=${pkgver} 'aufs4')
 # below 'provides' is for when you have no other kernel (which is a bad idea anyway)
 # provides=(${pkgbase}=${_basekernel} 'linux=${pkgver}' 'aufs4')

 # If generic build, then conflict with all optimized ones
 for _cpusuffix in "${_CPUSUFFIXES[@]}" ; do
   conflicts+=(${pkgbase}-${_cpusuffix})
 done

 replaces=('aufs3')
 backup=("etc/mkinitcpio.d/${pkgbase}.preset")
 install="$pkgbase.install"

 #'
  cd "${srcdir}/${_srcname}"

  # Remove undeeded aufs4 git tree
  rm -fr aufs4 2>/dev/null

  # work around the AUR parser
  # This allows building cpu-optimized packages with according package names.
  # Useful for repo maintainers.
  headers="headers"
  pkgnameopt="${pkgbase}"        # this MUST be outside the following 'if'
  if [[ "$_PKGOPT" = "y" ]]; then    # package naming according to optimization
    case $CPU in
     CORE2)
         pkgname="${pkgbase}-core2"
         pkgdesc="${_pkgdesc} Intel Core2 optimized."
         ;;
     K7)
         pkgname="${pkgbase}-k7"
         pkgdesc="${_pkgdesc} AMD K7 optimized."
         ;;
     K8)
         pkgname="${pkgbase}-k8"
         pkgdesc="${_pkgdesc} AMD K8 optimized."
         ;;
     K10)
         pkgname="${pkgbase}-k10"
         pkgdesc="${_pkgdesc} AMD K10 optimized"
         ;;
     BARCELONA)
         pkgname="${pkgbase}-barcelona"
         pkgdesc="${_pkgdesc} AMD Barcelona optimized."
         ;;
     BOBCAT)
         pkgname="${pkgbase}-bobcat"
         pkgdesc="${_pkgdesc} AMD Bobcat optimized."
         ;;
     BULLDOZER)
         pkgname="${pkgbase}-bulldozer"
         pkgdesc="${_pkgdesc} AMD Bulldozer optimized."
         ;;
     PILEDRIVER)
         pkgname="${pkgbase}-piledriver"
         pkgdesc="${_pkgdesc} AMD Piledriver optimized."
         ;;
     PSC)
         pkgname="${pkgbase}-psc"
         pkgdesc="${_pkgdesc} Intel Pentium4/D/Xeon optimized."
         ;;
     ATOM)
         pkgname="${pkgbase}-atom"
         pkgdesc="${_pkgdesc} Intel Atom optimized."
         ;;
     PENTIUMII)
         pkgname="${pkgbase}-p2"
         pkgdesc="${_pkgdesc} Intel Pentium2 optimized."
         ;;
     PENTIUMIII)
         pkgname="${pkgbase}-p3"
         pkgdesc="${_pkgdesc} Intel Pentium3 optimized."
         ;;
     PENTIUMM)
         pkgname="${pkgbase}-pm"
         pkgdesc="${_pkgdesc} Intel Pentium-M optimized."
         ;;
     PENTIUM4)
         pkgname="${pkgbase}-p4"
         pkgdesc="${_pkgdesc} Intel Pentium4 optimized."
         ;;
     COREI7)
         pkgname="${pkgbase}-nehalem"
         pkgdesc="${_pkgdesc} Intel Core Nehalem optimized."
         ;;
     COREI7AVX)
         pkgname="${pkgbase}-sandybridge"
         pkgdesc="${_pkgdesc} Intel 2nd Gen Core processors including Sandy Bridge."
         ;;
     COREAVXI)
         pkgname="${pkgbase}-ivybridge"
         pkgdesc="${_pkgdesc} Intel 3rd Gen Core processors including Ivy Bridge."
         ;;
     COREAVX2)
         pkgname="${pkgbase}-haswell"
         pkgdesc="${_pkgdesc} Intel AVX-2 processors including Haswell."
         ;;
     default)
  # Note to me: DO NOT EVER REMOVE THIS. It's for the AUR PKGBUILD parser.
         pkgname="${pkgbase}"
         pkgdesc="Linux kernel and modules with the pf-kernel patchset [-ck patch (BFS included), TuxOnIce, BFQ, UKSM] and aufs4. Long-term support."
         ;;
    esac

  # If optimized build, conflict with generic and other optimized ones
  if [[ "$pkgname" != "$pkgbase" ]]; then
    pkgnameopt="${pkgname}"        # this MUST be inside this if-fi
    pkgname="${pkgbase}"
#    echo pkgname $pkgnameopt
    cpuopt=`sed -e "s/linux-pf-lts-//" <<<$pkgnameopt`        # get suffix
    cpuoptdesc=`sed -e "s/${_pkgdesc}//" <<<$pkgdesc`    # get description
    conflicts=(${conflicts[@]/${pkgbase}-${cpuopt}/})        # remove current
    conflicts=(${conflicts[@]/${pkgbase}-headers-${cpuopt}/})    # remove current's headers
    export cpuopt cpuoptdesc
  fi

  # second batch check ends here
 fi

 # Pass conflicts array to linux-pf-lts-headers() BEFORE adding generic linux-pf-lts or headers will conflict
#  export _conflicts=${conflicts[@]}
  if [[ $cpuopt ]]; then
    conflicts+=(${pkgbase})        # add generic
  fi
#  conflicts=('linux-pf-lts' ${conflicts[@]})    # add generic packages

  echo
  echo "    ========================================"
  msg  "The packages will be named ${pkgnameopt}"
  if [[ "$cpuopt" ]]; then
       msg  "and ${pkgbase}-${headers}-${cpuopt}"
  else
       msg  "and ${pkgbase}-${headers}"
  fi
  msg  "${pkgdesc}"
  echo "    ========================================"
  echo

  cd "${srcdir}/linux-${_basekernel}"

  KARCH=x86

  # get kernel version
  _kernver="$(make LOCALVERSION= kernelrelease)"
#  _basekernel=${_kernver%%-*}
#  _basekernel=${_basekernel%.*}

  ### c/p from linux-lts

  mkdir -p "${pkgdir}"/{lib/modules,lib/firmware,boot}
  make LOCALVERSION= INSTALL_MOD_PATH="${pkgdir}" modules_install
  cp arch/$KARCH/boot/bzImage "${pkgdir}/boot/vmlinuz-${pkgbase}"

  # set correct depmod command for install
  cp -f "${startdir}/${install}" "${startdir}/${install}.pkg"
  true && install=${install}.pkg
  sed \
    -e  "s/KERNEL_NAME=.*/KERNEL_NAME=${_kernelname}/" \
    -e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=${_kernver}/" \
    -i "${startdir}/${install}"

  # install mkinitcpio preset file for kernel
  install -D -m644 "${srcdir}/${pkgbase}.preset" "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"
  sed \
    -e "1s|'linux.*'|'${pkgbase}'|" \
    -e "s|ALL_kver=.*|ALL_kver=\"/boot/vmlinuz-${pkgbase}\"|" \
    -e "s|default_image=.*|default_image=\"/boot/initramfs-${pkgbase}.img\"|" \
    -e "s|fallback_image=.*|fallback_image=\"/boot/initramfs-${pkgbase}-fallback.img\"|" \
    -i "${pkgdir}/etc/mkinitcpio.d/${pkgbase}.preset"

  # install pacman hook for initramfs regeneration
  sed "s|%PKGBASE%|${pkgbase}|g" "${srcdir}/90-linux.hook" |
    install -D -m644 /dev/stdin "${pkgdir}/usr/share/libalpm/hooks/90-${pkgbase}.hook"

  # remove build and source links
  rm -f "${pkgdir}"/lib/modules/${_kernver}/{source,build}
  # remove the firmware
  rm -rf "${pkgdir}/lib/firmware"
  # make room for external modules
  ln -s "../extramodules-${_basekernel}${_kernelname:--ARCH}" "${pkgdir}/lib/modules/${_kernver}/extramodules"
  # add real version for building modules and running depmod from post_install/upgrade
  mkdir -p "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}"
  echo "${_kernver}" > "${pkgdir}/lib/modules/extramodules-${_basekernel}${_kernelname:--ARCH}/version"

  # Now we call depmod...
  depmod -b "${pkgdir}" -F System.map "${_kernver}"

  # move module tree /lib -> /usr/lib
  mkdir -p "${pkgdir}/usr"
  mv "${pkgdir}/lib" "${pkgdir}/usr/"

  # add vmlinux
  install -D -m644 vmlinux "${pkgdir}/usr/lib/modules/${_kernver}/build/vmlinux"

# end c/p

  ###
  # Trick the AUR parser to accept split PKGBUILD
  true && pkgname="${pkgnameopt}"
}

_package-headers() {
msg "Running package-${pkgbase}()"
  pkgdesc="Header files and scripts for building modules for linux-pf-lts kernel."
#  IFS=' ' read -a conflicts <<<${_conflicts}
#  conflicts=( ${_conflicts[@]} )
  conflicts=()
  for _cpusuffix in "${_CPUSUFFIXES[@]}" ; do
    conflicts+=(${pkgbase}-headers-${_cpusuffix})
  done

  # Remove own headers and add generic ones to conflicts, if optimized
  if [[ $cpuopt ]]; then
    conflicts=(${conflicts[@]/${pkgbase}-headers-${cpuopt}/})    # remove current
    conflicts+=(${pkgbase}-headers)        # add generic
  fi

  [[ ${cpuopt} ]] && pkgname=${pkgname}-${cpuopt}    # && depends=${depends}-${cpuopt}
  [[ ${cpuoptdesc} ]] && pkgdesc=${pkgdesc}${cpuoptdesc}
  provides=(${pkgbase}-headers linux-headers=${pkgver})
  cd "${srcdir}/linux-${_basekernel}"

# c/p from linux-ARCH

  install -dm755 "${pkgdir}/usr/lib/modules/${_kernver}"

  cd "${srcdir}/${_srcname}"
  install -D -m644 Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Makefile"
  install -D -m644 kernel/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/kernel/Makefile"
  install -D -m644 .config \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/.config"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include"

  for i in acpi asm-generic config crypto drm generated keys linux math-emu \
    media net pcmcia scsi soc sound trace uapi video xen; do
    cp -a include/${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/include/"
  done

  # copy arch includes for external modules
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86"
  cp -a arch/x86/include "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/x86/"

  # copy files necessary for later builds, like nvidia and vmware
  cp Module.symvers "${pkgdir}/usr/lib/modules/${_kernver}/build"
  cp -a scripts "${pkgdir}/usr/lib/modules/${_kernver}/build"

  # fix permissions on scripts dir
  chmod og-w -R "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/.tmp_versions"

  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel"

  cp arch/${KARCH}/Makefile "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"

  if [ "${CARCH}" = "i686" ]; then
    cp arch/${KARCH}/Makefile_32.cpu "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/"
  fi

  cp arch/${KARCH}/kernel/asm-offsets.s "${pkgdir}/usr/lib/modules/${_kernver}/build/arch/${KARCH}/kernel/"

  # add docbook makefile
  install -D -m644 Documentation/DocBook/Makefile \
    "${pkgdir}/usr/lib/modules/${_kernver}/build/Documentation/DocBook/Makefile"

  # add dm headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"
  cp drivers/md/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/md"

  # add inotify.h
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux"
  cp include/linux/inotify.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/linux/"

  # add wireless headers
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"
  cp net/mac80211/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/net/mac80211/"

  # add dvb headers for external modules
  # in reference to:
  # http://bugs.archlinux.org/task/9912
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core"
  cp drivers/media/dvb-core/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-core/"
  # and...
  # http://bugs.archlinux.org/task/11194
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"
  cp include/config/dvb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/include/config/dvb/"

  # add dvb headers for http://mcentral.de/hg/~mrec/em28xx-new
  # in reference to:
  # http://bugs.archlinux.org/task/13146
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  cp drivers/media/dvb-frontends/lgdt330x.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"
  cp drivers/media/i2c/msp3400-driver.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/i2c/"

  # add dvb headers
  # in reference to:
  # http://bugs.archlinux.org/task/20402
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb"
  cp drivers/media/usb/dvb-usb/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/usb/dvb-usb/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends"
  cp drivers/media/dvb-frontends/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/dvb-frontends/"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners"
  cp drivers/media/tuners/*.h "${pkgdir}/usr/lib/modules/${_kernver}/build/drivers/media/tuners/"

  # add xfs and shmem for aufs building
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/fs/xfs"
  mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/mm"

  # copy in Kconfig files
  for i in $(find . -name "Kconfig*"); do
    mkdir -p "${pkgdir}"/usr/lib/modules/${_kernver}/build/`echo ${i} | sed 's|/Kconfig.*||'`
    cp ${i} "${pkgdir}/usr/lib/modules/${_kernver}/build/${i}"
  done

  # add objtool for external module building and enabled VALIDATION_STACK option
  if [ -f tools/objtool/objtool ];  then
      mkdir -p "${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool"
      cp -a tools/objtool/objtool ${pkgdir}/usr/lib/modules/${_kernver}/build/tools/objtool/
  fi

  chown -R root.root "${pkgdir}/usr/lib/modules/${_kernver}/build"
  find "${pkgdir}/usr/lib/modules/${_kernver}/build" -type d -exec chmod 755 {} \;

  # strip scripts directory
  find "${pkgdir}/usr/lib/modules/${_kernver}/build/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
    case "$(file -bi "${binary}")" in
      *application/x-sharedlib*) # Libraries (.so)
        /usr/bin/strip ${STRIP_SHARED} "${binary}";;
      *application/x-archive*) # Libraries (.a)
        /usr/bin/strip ${STRIP_STATIC} "${binary}";;
      *application/x-executable*) # Binaries
        /usr/bin/strip ${STRIP_BINARIES} "${binary}";;
    esac
  done

  # remove unneeded architectures
  rm -rf "${pkgdir}"/usr/lib/modules/${_kernver}/build/arch/{alpha,arc,arm,arm26,arm64,avr32,blackfin,c6x,cris,frv,h8300,hexagon,ia64,m32r,m68k,m68knommu,metag,mips,microblaze,mn10300,openrisc,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,unicore32,um,v850,xtensa}
#  end c/p
}

pkgname=("${pkgbase}" "${pkgbase}-headers")
for _p in ${pkgname[@]}; do
  eval "package_${_p}() {
    $(declare -f "_package${_p#${pkgbase}}")
    _package${_p#${pkgbase}}
  }"
done

