# Maintainer: MrHritik <Hritikxx8 at gmail dot com>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=brackets-bin
_pkgname=brackets
pkgver=1.14
pkgrel=2
pkgdesc="A code editor for HTML, CSS and JavaScript. "
arch=("x86_64")
url="http://brackets.io"
license=("MIT")
depends=("gconf" "libgcrypt15" "nodejs" "nspr" "nss" "systemd" "libxss")
optdepends=("google-chrome: to enable Live Preview"
            "gnuplot: to enable node benchmarking"
            "gtk2: to enable native UI"
            "ruby: to enable LiveDevelopment Inspector"
            "desktop-file-utils: for update-desktop-database"
            "hicolor-icon-theme: for hicolor theme hierarchy")
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git')
install=$pkgname.install

source=("https://github.com/Hritik14/brackets-bin/raw/master/data.tar.xzaa" "https://github.com/Hritik14/brackets-bin/raw/master/data.tar.xzab" "https://github.com/Hritik14/brackets-bin/raw/master/data.tar.xzac")
noextract=("data.tar.xzaa" "data.tar.xzab" "data.tar.xzac")
sha512sums=('cf2633293f50152b8558245353ff0d7efc8bcbaaf0f29421e12d0b2bf4e72c1e623c7d591d8221c5eba87defec9ad02053694f4c16d3ef8acdd26eff7f948bcb' 'a88781f1ebeee735a993413f191214b6f229bd9b17fc2c0a1f54b57ed9277557a46227ef1d347e419c28535e4e4ff5fb881b75f1d48b0f4f05ef54e683f87ba8' '5ccaff0fde7d65bf6d3a99e4afa114e88e06496ee3c3f5292d87138e24f33be7efaf150612b1bd18766e77c750e8b5efca84804ba278714db07a70552b79dc61')

 
prepare() {
  cd $srcdir

  msg2 "Merging files..."
  cat data.tar.xz* > data.tar.xz
  msg2 "Extracting files..."
  tar -xf data.tar.xz
}

package() {
  cd $srcdir

  msg2 "Installing program..."

  install -d $pkgdir/opt
  cp -r opt/$_pkgname $pkgdir/opt/$_pkgname

  chmod -R a+rw $pkgdir/opt/$_pkgname/samples

  install -d $pkgdir/usr/bin
  ln -s /opt/brackets/brackets $pkgdir/usr/bin/$_pkgname

  msg2 "Installing icons..."
  cp -r usr $pkgdir/usr

  msg2 "Installing .desktop file..."
  install -d $pkgdir/usr/share/applications
  sed 's/Development/Development;/' opt/$_pkgname/$_pkgname.desktop > $pkgdir/usr/share/applications/$_pkgname.desktop

  msg2 "Installing license..."
  install -Dm755 usr/share/doc/$_pkgname/copyright $pkgdir/usr/share/licenses/$_pkgname/copyright

  install -Dm4755 $srcdir/opt/brackets/chrome-sandbox \
    "$pkgdir/opt/brackets/chrome-sandbox"


}
