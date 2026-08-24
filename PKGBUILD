# Maintainer: Zoddo <archlinux+aur@zoddo.fr>
# Contributor: Thaodan <AUR+me@thaodan.de>
# Contributor: Manuel Hüsers <aur@huesers.de>
# Contributor: huyizheng
# Contributor: johnnyapol <arch@johnnyapol.me>

# Based off the discord community repo PKGBUILD by Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=discord
_electron=electron
pkgname=${_pkgname}_arch_electron
pkgver=1.0.155
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
        "discord_arborium-${pkgver}.tar.br::https://stable.dl2.discordapp.net/distro/app/stable/linux/x64/${pkgver}/discord_arborium/1/full.distro")
sha512sums=('cb5193ed3e7070845eb74570876f191e7ee113d97de0b3521bd14ff7f16e90077b8dc1f8f9d6ffa472261841d976c69b7c772d6bd8c24b6d8edb17f577e38dbb'
            '2590151db4404a9ecbae2c45269c74f5ea26479967de5bc0b221a9143f4efeeeda9e335c23cf1f982680ab4fd895dcf3fd5731bd230908b3b2568eee0ec223ec'
            '5cccf397a772fed0db9b19253e496e78af27810227325ce681de985e2e0fbbdb195873d9642574ad3ae7bfcf4699bfdaa16933ca50c13cb98a1ff53c86c6de05'
            'd5373e2b2e9754bdcdbcda81fc1392ce6605939651839868823f3c3e0bf16f6fba2fb73bc1a0ff230eebd743d1463f2e8b2295503248f14845b3a56e57385bd1'
            '85da93530b2b92faad58cc84d0f7ddaea6b22fbec413e806c1981eb6369a301ec995eee6bfbe6b828e2cd0baf6168e578bbde456f2450a13199994ff9a1e7cd0'
            '722173a841ec6730453ba6673f515dc94e63dde5b708b330e4778d58ee746aa7c05b7a29ca7bf74cf4794fdc3085efae9022b29984df297bf0b263154ba6f65f'
            '18f7b8eac72605f49069fd5ab507a544a69a060de80b77aef0d58b2ee70e1f885340bd1821129da3c0eecf492a8d36e55fa12e6ac65584091afc1244ac458542'
            '1bbd454d218a0a803d0a6306d914cdc6024b7648965528699685c889c0fac08660a065899ef04d61a29fa1e166d583f2d054e12ec6f049675fb58181cbb01ac4'
            'be9f8c2a91b92638cb3e0baffba7928bf68327217df06b903109ad71629ff0fb4d29b92510ae85aa4c4eeb311c2c38b19f22537de66be3ac289478b3fe0a3ce1'
            'b98cee5f0ff37ef0fd28e27b3960cd74dd46faab38c577de10c8f1323de5f029d41b0c4b31ac199c167828ea382d0bed82e6a37e61240a1d1c14fc954f8b2b0d'
            '4d8803a3c166b83a45ff577b21cd56c0029b714f3a2660c15acd8d7e0fffa5043102250d82fbcd52012300c00fe108ded97f3cf6af31295b5d9ad9c3cddd7fc1'
            '9bddfb9e2e3eb6dcba80f074c63e5da2d55fb8ae8546089b8c2d8e7e6fb11c4b6ce1dab48bc370572973499663e2419ccd38d970f8144c9a9d466c94f27a5ac5'
            'bd70e9d76e767bff3dcfeaf15d2815899b009240763f4cfcef6c4ae2423f3f798a6f791e6221cb9fd97424df91300ea49f36a2c22725c357f2538c14703a6c79'
            'accd25d6c28cdffe9c96808459937e251174e7eec7f004b7b13f89282be97bbb61b0a57f282a9e7f5e3eb7c16fa5e64b6c052b9b18d6319219d4150067e4ad14'
            '52a3bf65dbbb6947eb91a5031608f1fc5a62a805cf9239ad03c38ec2e71fb80537041f5def7854720fdebb123159805257593da4cc4397923a6615c7d48be26c'
            'a70622fa9ead15a33686240e170d5f7a792109c59aedb158ad829eac297f2b5199c7aed84ca2be5afa0d83e7b5fa706848a0c3cca2a30e244e7babc456cc27f3'
            '3ae528766792f2a5e98bbccb64015353af3724cbcb153553d78a5a26fc3cbcaf83e19907f7a8246b32b75f1858f5e409f30d1dfa758a22afa8ddafb63e16dcec'
            '2b3023d4f0e8265b298aa2d8852ff32c7251f5ef2de8f009fc0c4c6c17260388e9d26d17cd196289acbe4a1f5a4045bd5838c3e63c8ed4a55d1bb61438a95b03'
            '68dde1b78870e5f450fc5c1419c86cee7e246a854f881d5d58d32f6c6f91405dec3cb0fcf32efb0d8a0ee4958e831f47ff3f624fedfd2d6a3477b67a31c083bb')

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
