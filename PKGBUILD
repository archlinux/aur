# Maintainer: KuoHuanHuan <hi@nekohuan.cyou>
# Contributor: MrHritik <Hritikxx8@gmail.com>
# Contributor: danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec@gmail.com>

pkgname=brackets-bin
_pkgname=brackets
pkgver=1.14.1
pkgrel=1
pkgdesc="A code editor for HTML, CSS and JavaScript. (Waiting for new release for Linux, hold on.)"
arch=("x86_64")
url="https://brackets.io"
license=("MIT")
depends=("gconf" "libgcrypt15" "nodejs>=12" "nspr" "nss" "systemd" "libxss")
optdepends=(
            "google-chrome: to enable Live Preview"
            "gnuplot: to enable node benchmarking"
            "gtk2: to enable native UI"
            "ruby: to enable LiveDevelopment Inspector"
            "desktop-file-utils: for update-desktop-database"
            "hicolor-icon-theme: for hicolor theme hierarchy"
          )
provides=("brackets=$pkgver")
conflicts=('brackets' 'brackets-git')
install=$pkgname.install

source=("https://cdn.jsdelivr.net/gh/kuohuanhuan-forkonly/brackets-bin@master/data.tar.xzaa" "https://cdn.jsdelivr.net/gh/kuohuanhuan-forkonly/brackets-bin@master/data.tar.xzab")
noextract=("data.tar.xzaa" "data.tar.xzab")
sha512sums=(
  '2094065e915650bccd9707334ab73b70dd0fcf3bfb397608329e58f91a58fa0cffe7855483c0e152cda4b6231f54918774a2d467efe719c14c19fbbef026a8d1' '0dd731232b642dfd0fe9eb7533fcfe2a32de5bb8ab1c72f458b3437db9f893b840fc3323f58240b2ec0ee6324c5cef45bdda05a763ecb442d02d75d5ab3cf200'
) # May be SKIP soon

prepare() {
  echo "This version is the latest support Linux, with GitHub issue https://github.com/brackets-cont/brackets/issues/112 we got it will be supported soon, hold on and use v1.14.1 at-this-risk."
  echo "--------------------------------------------------"
  cd $srcdir
  msg2 "Merging files..."
  cat data.tar.xz* > data.tar.xz
  msg2 "Extracting files..."
  tar -xf data.tar.xz
}
package() {
  cd $srcdir
  msg2 "Installing main program..."
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
