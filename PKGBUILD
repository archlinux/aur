# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.160
pkgrel=1
epoch=1
pkgdesc="Discord using system provided ${_electron} for increased security and performance"
arch=('x86_64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
url='https://discord.com'
license=('LicenseRef-custom')
options=('!strip')
install="$pkgname.install"
depends=("${_electron}" 'libxss')
makedepends=('asar'
             'jq'
             'python-pyelftools' # Required for Krisp patcher
             'python-capstone') # Required for Krisp patcher
optdepends=('libpulse: Pulseaudio support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'LICENSE.html::https://discord.com/terms'
        'OSS-LICENSES.html::https://discord.com/licenses'
        'discord-launcher.sh'
        'krisp-patcher.py'

        # Discord modules (from 'curl "https://updates.discord.com/distributions/app/manifests/latest?channel=stable&platform=linux&arch=x64"')
        "core-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/full.distro"
        "discord_desktop_core-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_desktop_core/1/full.distro"
        "discord_zstd-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_zstd/1/full.distro"
        "discord_krisp-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_krisp/1/full.distro"
        "discord_rpc-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_rpc/1/full.distro"
        "discord_utils-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_utils/1/full.distro"
        "discord_voice-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_voice/1/full.distro"
        "discord_game_utils-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_game_utils/1/full.distro"
        "discord_erlpack-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_erlpack/1/full.distro"
        "discord_modules-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_modules/1/full.distro"
        "discord_spellcheck-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_spellcheck/1/full.distro"
        "discord_dispatch-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_dispatch/1/full.distro"
        "discord_cloudsync-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_cloudsync/1/full.distro"
        "discord_sysimg-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_sysimg/1/full.distro")
sha512sums=('cc6e7ab2f5d6cb11a624fe72ecdf115ce1479234673056126624ad905f203490e7aeb259dd75bd2f949b30d902ef50f89aec10dc83c3518a0498a4900ca138a5'
            '2590151db4404a9ecbae2c45269c74f5ea26479967de5bc0b221a9143f4efeeeda9e335c23cf1f982680ab4fd895dcf3fd5731bd230908b3b2568eee0ec223ec'
            '5cccf397a772fed0db9b19253e496e78af27810227325ce681de985e2e0fbbdb195873d9642574ad3ae7bfcf4699bfdaa16933ca50c13cb98a1ff53c86c6de05'
            'd5373e2b2e9754bdcdbcda81fc1392ce6605939651839868823f3c3e0bf16f6fba2fb73bc1a0ff230eebd743d1463f2e8b2295503248f14845b3a56e57385bd1'
            '85da93530b2b92faad58cc84d0f7ddaea6b22fbec413e806c1981eb6369a301ec995eee6bfbe6b828e2cd0baf6168e578bbde456f2450a13199994ff9a1e7cd0'
            'bc20f2cf21fbc721eb4fe5928f08046ade622b1826b5228c7d116a409093af8646a538a86698e2b4f4d54732e8fe7c4ad605edc61abf1d028ecbbd58686077ed'
            '9ce231bad5becf60aba3c6cb19b2b1c9eb32057d71c6e3215acc97be5d3dd05429035fc9f0e19ebfc04ff9ebfcba6dbaf07bcad4e23a82ce10d4ed3101236469'
            '6ca005c0a9c4b4bfcd77fb5d147544f252bf479ee164a2d554a6805c4744136c7227fb086821f84672288159d67fbb3a9bdfc69a592c488ad2336c52f54885ca'
            '4d253c9dd524fa9ad49f1dc03bd6ed07de920610eda3864d42081b722c5b6966fab556fcafe3e12175159252d68e481b1388a70eb156e7e2e8aaacd5a4d009e1'
            '4aff0bf3264cacfb638a129be5206416e9ce986201e6defcf0d862b4d8c4b975b3d0cebefc3c333e49841b893d58e878cedc9452f4bea7cfdf8c718fcac1b6e2'
            '858755f94d19f379c46fa4e7781d45e1de6e6d25b5fc949206a33d2bdddb0ee2b4fff2408f6b6b85a2b12283e46a77fd1f2623797ff3cb210faba9c8a5ddb4a4'
            '97fa6e00228cb9acec1492a3a7830201befac96df23ecdfa0e9c8b2528348b4abe893fc918f21db970212872a12703913bd84b2f8a763d27850da73fc65d1532'
            '0f2331d04260d09cc7b7f9dd2dd86aff3827a5e08f69a2405b51e22a210706748e563a653fb062d391cb841e9d9de97794a1e1c3b3cfce2a8b2bd959d0780c43'
            '5e5786debabeb8420afb8fbfc4c269110c94fa1d5ad6192ef6cc4c9ac5ca842b1e3e6706a19f06848093d03a45a5584b2369127b655f5765c02dbbc570094927'
            'c19e670a3de8837f12214acd52f85cee9a61d3a6dfb75195d690a1556395387b044ecaa631787b46c2caa46bf58a4a1d15074184f560c36c40d10f54208185eb'
            '02c6e368553a36933b7f411e3e126c0e88c4cfce215d2588b44d7f9daa946c82231b40ae3e4a76cf7357dfb63efaa6c734994c3eb2084f2709db57bf56fc6305'
            '5bd97ac9c4ca81dcc2cc6846008289e35222c7218d8a27eb7f3be392bc6da30f09b4dcac001331377fe74cb296f9c1bb3cf69a4c6218eec5d811db6396c43aac'
            'e9ae5f2e8a161fff1e75cc7a783089a08c26dee0d27dbabef6236cd2e78062086e85484311a837afcf20fa52467656f3819a7947ad1510b17608561b33aacdbd'
            '50a991478dcc3d19949ee3be2f5bcf0a9eb198464f408efe1c5347802362b08fbda65417b1a95df096047278fe2612b53c6d2937eaaa7254155ec02ecf03e9a5')

# Skip "LICENSE.html" and "OSS-LICENSES.html" files hashes as they are unstable
# Since "updpkgsums"/"pkgctl version upgrade" overwrite the checksum array with
# literal hashes, set them to SKIP with indexed assignments (pacman-contrib#119)
# https://gitlab.archlinux.org/pacman/pacman-contrib/-/issues/119
sha512sums[1]='SKIP'
sha512sums[2]='SKIP'

# Colored makepkg-like functions
_all_off="$(tput sgr0)"
_bold="${_all_off}$(tput bold)"
_blue="${_bold}$(tput setaf 4)"
_red="${_bold}$(tput setaf 1)"
msg_blue() {
  printf "${_blue}  ->${_bold} $1${_all_off}\n"
}
error() {
  printf "${_blue}==>${_red} ERROR:${_bold} %s${_all_off}\n" "$1" >&2
  exit 1
}

prepare() {
  msg_blue "Extracting core-${pkgver}.tar.br"
  tar -xf core-${pkgver}.tar.br --use-compress-program=brotli --one-top-level=core --strip-components=1 files/

  for module in discord_*.tar.br; do
    msg_blue "Extracting ${module}"
    tar -xf "${module}" --use-compress-program=brotli --one-top-level="modules/${module%%-*}" --strip-components=1 files/
  done

  # prepare launcher script
  sed -i -e "s|@PKGNAME@|${_pkgname}|" \
    -e "s|@ELECTRON@|${_electron}|" \
    discord-launcher.sh

  # fix the .desktop file
  sed -i -e "s|Exec=.*|Exec=/usr/bin/${_pkgname}|" ${_pkgname^}/$_pkgname.desktop
}

build() {
  msg_blue 'Patching app.asar to use system electron'

  asar e core/resources/app.asar core/resources/app
  rm core/resources/app.asar
  sed -i \
    -e "s|^Exec=\${exePath}$|Exec=/usr/bin/${_pkgname}|" \
    -e "s|^Name=\${appName}$|Name=${_pkgname^}|" \
    -e "s|^Icon=\${iconPath}$|Icon=${_pkgname}|" \
    -e "s|resourcesPath=path_1\.default\.join(require\.main\.filename,\"\.\.\",\"\.\.\"),|resourcesPath='/usr/share/${_pkgname}/resources',|" \
    -e "s|process\.resourcesPath|'/usr/share/${_pkgname}/resources'|g" \
    core/resources/app/bundle.js
  sed -i -e "s|process\.resourcesPath|'/usr/share/${_pkgname}/resources'|" core/resources/app/splashScreenPreload.js

  # This is required to properly show the window icon under wayland
  jq ".desktopName = \"${_pkgname}.desktop\"" core/resources/app/package.json > tmp.json
  mv tmp.json core/resources/app/package.json

  asar p core/resources/app core/resources/app.asar
  rm -rf core/resources/app

  # Set the newUpdater key to false in build_info.json in order to disable the new Discord updater (released on 2026-05-04, version 1.0.136),
  # Also add a localModulesRoot key that points to the Discord modules we're packaging.
  jq ".newUpdater = false | .localModulesRoot = \"/usr/share/${_pkgname}/modules\"" core/resources/build_info.json > tmp.json
  mv tmp.json core/resources/build_info.json

  msg_blue 'Patching Krisp to run with system electron'
  # original: https://github.com/sersorrel/sys/blob/main/hm/discord/krisp-patcher.py
  python krisp-patcher.py "modules/discord_krisp/discord_krisp.node" \
    || error 'Krisp patcher failed. You can comment it out in the PKGBUILD, but Krisp will not work.'

  # Krisp fails to initialize if this directory is not present (or if can't be created). Logs:
  #   [MediaEngineStore] Failed to load Krisp module: Failed to setup Krisp module, error code: -4
  #   [AVError] AV error reported: noise-canceller-error {"underlyingError":"NoiseCancellerError.KRISP_INIT_ERROR_GLOBAL_INIT"}
  mkdir -p "modules/discord_krisp/KMS/logs"
}

package() {
  # create necessary directories
  install -d "${pkgdir}/usr/share/${_pkgname}"

  # copy relevant data
  cp -r core/resources/ "${pkgdir}/usr/share/${_pkgname}/"
  cp -r modules/ "${pkgdir}/usr/share/${_pkgname}/"

  # intall icon and desktop file
  install -Dm 644 ${_pkgname^}/$_pkgname.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  install -Dm 644 ${_pkgname^}/$_pkgname.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # install the launch script
  install -Dm 755 discord-launcher.sh "${pkgdir}/usr/bin/${_pkgname}"

  # install licenses
  install -Dm 644 LICENSE.html "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.html"
  install -Dm 644 OSS-LICENSES.html "${pkgdir}/usr/share/licenses/${pkgname}/OSS-LICENSES.html"
}
