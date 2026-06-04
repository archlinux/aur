# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=sigma-file-manager
pkgname=$_pkgname-bin
pkgdesc="A free, open-source, quickly evolving, modern file manager (explorer / finder) app (binary release)"
pkgver=2.1.0
pkgrel=1
arch=("x86_64")
url="https://github.com/aleksey-hoffman/sigma-file-manager"
license=('GPL3')
depends=(xz libgcc glib2 gtk3 hicolor-icon-theme glibc libsoup3 webkit2gtk-4.1 cairo gdk-pixbuf2)
conflicts=("$_pkgname")
provides=("$_pkgname")
_appimage=Sigma-File-Manager-$pkgver-Linux-Debian.AppImage
source=("$url/releases/download/v$pkgver/Sigma-File-Manager-$pkgver-linux.deb")
sha256sums=('728137654d20dc9bb75e80fa865f0f61c902c88dfd56c50cb3f6f806a5510614')

prepare() {
  # Extract the files
  tar -xf data.tar.gz
  # Fix the icon folder name
  cd usr/share/icons/hicolor
  cp -r 256x256@2 256x256
}

package() {
  cd usr
  install -Dm755 bin/$_pkgname -t "$pkgdir/usr/bin"
  cd share
  install -Dm644 applications/"Sigma File Manager.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
for i in 32 128 256; do
  install -Dm644 icons/hicolor/${i}x${i}/apps/$_pkgname.png -t "$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps"
done
}
