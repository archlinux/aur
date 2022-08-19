# Maintainer: su226 <thesu226 at outlook dot com>

pkgbase=dev-sidecar-git
pkgname=(dev-sidecar-git dev-sidecar-git-electron)
pkgver=1.7.3.r20.gfc0821f
pkgrel=1
pkgdesc="开发者边车，github打不开，github加速，git clone加速，git release下载加速，stackoverflow加速"
arch=(any)
url="https://github.com/docmirror/dev-sidecar"
license=("MPL-2.0")
depends=()
makedepends=(npm lerna libxcrypt-compat)
provides=(dev-sidecar)
conflicts=(dev-sidecar)
source=("git+https://github.com/docmirror/dev-sidecar.git"
        "dev-sidecar.desktop"
        "dev-sidecar.sh")
sha256sums=("SKIP"
            "4fbb8418638f73fb845e187c599b099377c340dc9a2121844ec08944378011f9"
            "251d5d03fbb807960055af37d1bf2e93a81c198e816c7238aa6e61c84cbddcc3")

pkgver() {
  cd dev-sidecar
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dev-sidecar
  lerna bootstrap
  cd packages/gui
  npm run electron:build
}

package_dev-sidecar-git() {
  # ldd gives these libraries. (dependencies removed)
  depends+=(nss alsa-lib gtk3)

  mkdir -p "$pkgdir/usr/bin"
  ln -s "/usr/lib/dev-sidecar/dev-sidecar" "$pkgdir/usr/bin/dev-sidecar"

  mkdir -p "$pkgdir/usr/lib"
  cp -rT "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked" "$pkgdir/usr/lib/dev-sidecar"
  mv "$pkgdir/usr/lib/dev-sidecar/@docmirrordev-sidecar-gui" "$pkgdir/usr/lib/dev-sidecar/dev-sidecar"

  mkdir -p "$pkgdir/usr/share/applications/apps"
  install -Dm644 "$srcdir/dev-sidecar.desktop" "$pkgdir/usr/share/applications/apps"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps/{16x16,24x24,32x32,48x48,64x64,128x128,256x256,512x512,1024x1024}"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/dev-sidecar.png"
}

package_dev-sidecar-git-electron() {
  depends+=(electron17)
  pkgdesc+="（使用系统Electron）"

  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/dev-sidecar.sh" "$pkgdir/usr/bin/dev-sidecar"

  mkdir -p "$pkgdir/usr/lib/dev-sidecar"
  cp -rT "$srcdir/dev-sidecar/packages/gui/dist_electron/bundled" "$pkgdir/usr/lib/dev-sidecar/app-unpacked"
  cp "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/app-update.yml" "$pkgdir/usr/lib/dev-sidecar/app-unpacked/dev-app-update.yml"
  cp -rT "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra" "$pkgdir/usr/lib/dev-sidecar/extra"

  mkdir -p "$pkgdir/usr/share/applications/apps"
  install -Dm644 "$srcdir/dev-sidecar.desktop" "$pkgdir/usr/share/applications/apps"

  mkdir -p "$pkgdir/usr/share/icons/hicolor/16x16/apps/{16x16,24x24,32x32,48x48,64x64,128x128,256x256,512x512,1024x1024}"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/16x16.png" "$pkgdir/usr/share/icons/hicolor/16x16/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/24x24.png" "$pkgdir/usr/share/icons/hicolor/24x24/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/256x256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/512x512.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/dev-sidecar.png"
  install -Dm644 "$srcdir/dev-sidecar/packages/gui/dist_electron/linux-unpacked/resources/extra/icons/1024x1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/dev-sidecar.png"
}
