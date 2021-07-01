# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=webos-sdk
pkgname=('webos-cli' 'webos-emulator' 'webos-ide')
pkgver=6.0.0
pkgrel=1
arch=('x86_64')
url='http://webostv.developer.lge.com/sdk/installation/'
# TODO: Licence
license=('custom:LG Software Development Kit License Agreement' 'APACHE')
makedepends=('unzip')
source=(
  'local:///webOS_SDK_TV_Installer_linux64_full.zip'
  'cli.patch'
  'emulator.patch'
  'webOS TV Emulator v6.0.0.desktop'
  'webOSIDE TV.desktop'
  'ide-launcher.sh'
)
sha512sums=('SKIP'
            '18e071d96b0e4cc57f4f51818cd2919b916551b5a3353fa69c0f966246dddcd1c17347932d3350f608554a1f10cd88b1d84d80bd1cbdfccfc2011cafe3f5ea78'
            '0eacf0a1f121f71df8fed007392d139d96817d18234026e6e2347d20e99ad0e4e5d1c9a8d31e2badef45ccf8f0d961d762f442da3aa8f98b74d23b8661525259'
            'd71730e1463e08ac018c5d4782f36df9d6b93decfe823441e9836b51443a4c9ef473f3be931febc72c9c875539b5f79a1ca90a5539585c5f7067cc144e173cb4'
            '60655118d3880b07ea19af1a316ecfc4b649cdd2b9672db5c8ce5c32cb246b8ff3cc4ec82b176b042c3622f3897e6702e8e30c060576869b826f25d2d5a472f1'
            '62d6de217f9a02deda2b945793a9a4df56264688c32406e5962336b8c4a00d74d84dfd14f86a8651d1ffc4cccecf50b6f3e3ead34bc9033eea27b60f2643568f')
options=('staticlibs')

package_webos-cli() {
  pkgdesc='LG webOS SDK cli tool'

  unzip -o webOS_SDK_TV_Installer_linux64_full/webOS_SDK_TV_linux64.zip
  unzip -o webOS_SDK/webos_cli_tv.zip
  install -dm 755 "${pkgdir}"/usr/{bin,share/webOS_TV_SDK/CLI,share/licenses/webos-sdk}
  cd CLI
  patch --strip=1 --input="../cli.patch"
  cd ../
  cp -dr --no-preserve='ownership' CLI/LICENSE.txt "${pkgdir}"/usr/share/licenses/webos-sdk/
  cp -dr --no-preserve='ownership' CLI "${pkgdir}"/usr/share/webOS_TV_SDK/
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/node
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/node
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-device-info
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-generate
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-inspect
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-install
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-launch
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-novacom
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-package
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-server
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/ares-setup-device
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares "${pkgdir}"/usr/bin/ares
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-device-info "${pkgdir}"/usr/bin/ares-device-info
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-generate "${pkgdir}"/usr/bin/ares-generate
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-inspect "${pkgdir}"/usr/bin/ares-inspect
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-install "${pkgdir}"/usr/bin/ares-install
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-launch "${pkgdir}"/usr/bin/ares-launch
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-novacom "${pkgdir}"/usr/bin/ares-novacom 
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-package "${pkgdir}"/usr/bin/ares-package 
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-server "${pkgdir}"/usr/bin/ares-server
  ln -sf /usr/share/webOS_TV_SDK/CLI/bin/ares-setup-device "${pkgdir}"/usr/bin/ares-setup-device
}

package_webos-emulator() {
  pkgdesc='LG webOS Emulator'
  depends=('virtualbox' 'webos-cli' 'java-runtime')

  install -dm 755 "${pkgdir}"/usr/share/{webOS_TV_SDK/Emulator/v"${pkgver}",applications,pixmaps}
  install -dm 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/Logs # For virtualbox
  unzip -o webOS_SDK/Emulator_tv_v"${pkgver}".zip
  cd Emulator
  patch --strip=1 --input="../emulator.patch"
  cd ../
  cp -dr --no-preserve='ownership' Emulator/v"${pkgver}"/ "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/
  # Virtualbox Image won't run else it has r/w permissions
  chmod 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/LG_webOS_TV_Emulator.vbox
  chmod 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/LG_webOS_TV_Emulator.vmdk
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/AppManager.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/LG_webOS_TV_Emulator.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/vm_register.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v"${pkgver}"/vm_remove.sh
  # Add Application entry for Emulator
  cp --no-preserve='ownership' 'webOS TV Emulator v6.0.0.desktop' "${pkgdir}"/usr/share/applications/
  cp --no-preserve='ownership' Emulator/v6.0.0/DTVEmulator.png "${pkgdir}"/usr/share/pixmaps/
  # TODD: On remove run vm_remove.sh
}

pre_remove_webos-emulator() {
  /usr/share/webOS_TV_SDK/Emulator/v5.0.0/vm_remove.sh
}

package_webos-ide() {
  pkgdesc='LG webOS IDE based on Eclipse'
  depends=('webos-cli')
  optdepends=('webos-emulator: Debugging in VirtualBox VM')

  install -dm 755 "${pkgdir}"/usr/share/{webOS_TV_SDK/,applications,pixmaps}
  unzip -o webOS_SDK/WebOSIDE.zip
  cp -dr --no-preserve='ownership' IDE "${pkgdir}"/usr/share/webOS_TV_SDK/
  cp --no-preserve='ownership' ide-launcher.sh "${pkgdir}"/usr/share/webOS_TV_SDK/IDE/
  # Adding permissions elso IDE won't run
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/IDE/launcher
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/IDE/webOSIDE
  chmod -R +x "${pkgdir}"/usr/share/webOS_TV_SDK/IDE/jre1.8.0_20/bin/
  # Add Application entry
  cp --no-preserve='ownership' 'webOSIDE TV.desktop' "${pkgdir}"/usr/share/applications/
  cp --no-preserve='ownership' IDE/webOSIDE.png "${pkgdir}"/usr/share/pixmaps/
}
