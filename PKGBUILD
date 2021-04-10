# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=webos-sdk
pkgname=('webos-cli' 'webos-emulator' 'webos-ide')
pkgver=5.0.3
pkgrel=1
arch=('x86_64')
url='http://webostv.developer.lge.com/sdk/installation/'
# TODO: Licence
license=('custom:LG Software Development Kit License Agreement' 'APACHE')
makedepends=('unzip')
source=(
  'local:///webOS SDK TV Installer linux64 full.zip'
  'cli.patch'
  'emulator.patch'
  'webOS TV Emulator v5.0.0.desktop'
  'webOSIDE TV.desktop'
  'ide-launcher.sh'
)
sha512sums=('SKIP'
            'b0962e9dff626417e217acae167bb800654c0250eff5ce3773192523b3dd469c185dc54f0c1fcfdd755d74cbb64333d57f786fbf5b63a13da28d17b9e768102e'
            '5a252c943117b5f23e6cf40d787da34a958b2ff24ac81a71350dea214717e65f9b64b56f7c59f72d3b89ac909f1ce2640f39f0a5d824107aae16cc295b333077'
            'f8c2b63d0d98cb4428ebdff32bde50970adf6dd040fef6d7b0c7853298a0fba7e978f3c8e06db29925613d769a5e9d24699887918de204a7f4f1352f1ffdfc5c'
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
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/x86_64/node
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/CLI/bin/i686/node
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

  install -dm 755 "${pkgdir}"/usr/share/{webOS_TV_SDK/Emulator/v5.0.0,applications,pixmaps}
  install -dm 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/Logs # For virtualbox
  unzip -o webOS_SDK/Emulator_tv_v5.0.0.zip
  cd Emulator
  patch --strip=1 --input="../emulator.patch"
  cd ../
  cp -dr --no-preserve='ownership' Emulator/v5.0.0/ "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/
  # Virtualbox Image won't run else it has r/w permissions
  chmod 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/LG_webOS_TV_Emulator.vbox
  chmod 777 "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/LG_webOS_TV_Emulator.vmdk
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/AppManager.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/LG_webOS_TV_Emulator.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/vm_register.sh
  chmod +x "${pkgdir}"/usr/share/webOS_TV_SDK/Emulator/v5.0.0/vm_remove.sh
  # Add Application entry for Emulator
  cp --no-preserve='ownership' 'webOS TV Emulator v5.0.0.desktop' "${pkgdir}"/usr/share/applications/
  cp --no-preserve='ownership' Emulator/v5.0.0/DTVEmulator.png "${pkgdir}"/usr/share/pixmaps/
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
