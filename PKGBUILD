# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.154
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
        "discord_dispatch-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_dispatch/1/full.distro")
sha512sums=('e8d84b6e99e7f8e9fb2094881d343f3c88beea3554570e3391fce78232e112be13f35e56951f92da758308a1d15d03a3a62a65191ac74098a369e1d0b03ac998'
            '2590151db4404a9ecbae2c45269c74f5ea26479967de5bc0b221a9143f4efeeeda9e335c23cf1f982680ab4fd895dcf3fd5731bd230908b3b2568eee0ec223ec'
            '5cccf397a772fed0db9b19253e496e78af27810227325ce681de985e2e0fbbdb195873d9642574ad3ae7bfcf4699bfdaa16933ca50c13cb98a1ff53c86c6de05'
            'd5373e2b2e9754bdcdbcda81fc1392ce6605939651839868823f3c3e0bf16f6fba2fb73bc1a0ff230eebd743d1463f2e8b2295503248f14845b3a56e57385bd1'
            '85da93530b2b92faad58cc84d0f7ddaea6b22fbec413e806c1981eb6369a301ec995eee6bfbe6b828e2cd0baf6168e578bbde456f2450a13199994ff9a1e7cd0'
            'e2428972ea2d93de6b49773606d2168c5b185fdd47dcc272578c4dc8d786b5b7013e5ac66d14d9e9c26631301d2de0c1ee7564162b9cc2dfe5fbaebc2eb56a02'
            '6c66898bf08c8d482432a4a018b749c23bede5fc3f81b2d4bd392465cfa2f1036b04be8fca8f1cfd4179893a2a126d36bc27a439d0e4265888708ce6c375f223'
            'f2172daaab92665c9cab4d8aae9bce54c4a29b3cd11caa2a1fb0dfaa3c228943b49da7a7e0b2fdde36e17f0b9fd11aa19c3637aa47baa98de283c38a19dbc957'
            '5b5813e1a1f620945f89d7e2009be7d95b23f833d573fc8d232502ff06f634e4a25b4b969162f05416130728b71ae7b59ad7f3d80933e287891ac15f9af632ed'
            'ec37798e43b2737c516508ed17b683d54b635f84d2dafce87b0283081e49cf285b0500d0b4373ea9c53f5689f74b553aac852eff19ebed666e151f31fdcd6c48'
            '2018f433557b33107bf7bb26d92c3d283727b979968393a280082ba542325625a3331247025c6cd0609c1b28b75326015386049530c2dec64d024cedac0de2a9'
            'ec8a315c432e815e24d54ad9d83bb5b238aad23308af764646e90d7334e1d77fcd2aaff7036ea1e0ae8c8fe4b1404e7f3fc27baaa4cd3a8061dc9118012e45e1'
            'cb2bf555df79450ff46908a71cd92e27c2c52d015e80c3cebbe59bf61a40fa3fabaffb227759d0d6fc8cf267e686a5a2e3dee162aa3b78d68f7090d0a4c2982e'
            '66006ffa68f48a69f3d9afcd796d28a30b94c507f52b3450722c47de2f5c5bea0217f69d7a637337a29ab878ff0466cbcb6f43c73f103e87c5846e6d3aebb1c5'
            '507150269df5103d29e3c65531de8178f0f59d35a4b6ad27bdbf4f9bcd8034169d2c5a92f6ccb28999be9ae7c4dd786f7a3e6de6fc6ee257386c6cc5ded623fa'
            '82dff6dc4af0443a07c7a0449a4e4b1f5ce4b4a59deb45266f1b7f8eb04de75b641925e7ddca193f6056912e093c7b71937fed5d156f8c306d82ba1aae61d1d9'
            'de90b6c9b6e07fbcccceb5a325af9c4951e8a61f609166329b922cc881d4c397c2ef2ec050811b61a6ef93dd94232efa9291afa8bb0f4aee6ddc91afb1d8c5a1')

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
