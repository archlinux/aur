pkgname=ucloner
pkgver=10.10.2
rev=beta1
pkgrel=1
pkgdesc="Ucloner"
arch=('any')
url="https://code.google.com/p/ucloner"
license=('GPL')
depends=('python2' 'vte' 'squashfs-tools' 'zenity' 'gksu')
source=(
    'https://ucloner.googlecode.com/files/UCloner-10.10.2-beta1.tar.gz'
    'ucloner.sh'
    'ucloner.desktop'
    'ucloner.png'
    'modify_path.patch'
)

md5sums=('b7bf49a5516cb9e00943e06e3e73adf2'
         'd5143c3b0431044beb13f933a3d76ceb'
         '5ffe4317c280d220416e24317d0f6198'
         '1f913fe9ca34481134bc36e1045e9a20'
         '3e6d3d3005380a888b7a97d2b79880cf')


prepare() {
    cd "${srcdir}/UCloner-$pkgver-$rev"
    patch -p1 < "${srcdir}/modify_path.patch"
    cd program
    rm *.pyc
    python2 -m compileall .
}


package() {
  install -dm 755 "$pkgdir/opt"
  cp -r "${srcdir}/UCloner-$pkgver-$rev/program" "$pkgdir/opt/ucloner"
  install -Dm 755 "${srcdir}/ucloner.sh" "$pkgdir/usr/bin/ucloner"
  install -Dm 755 "${srcdir}/ucloner.desktop" "$pkgdir/usr/share/applications/ucloner.desktop"
  install -Dm 755 "${srcdir}/ucloner.png" "$pkgdir/usr/share/icons/ucloner.png"
}

