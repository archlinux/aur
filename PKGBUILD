# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=protonup-qt
pkgver=2.2.0
pkgrel=1
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
arch=('any')
url="https://davidotek.github.io/protonup-qt"
license=('GPL3')
depends=('pyside6' 'python-requests' 'python-vdf' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidoTek/ProtonUp-Qt/archive/refs/tags/v$pkgver.tar.gz"
        "net.davidotek.$pkgname.desktop"
        'pupgui2.sh')
sha256sums=('b018420daf525c36200699cef0c09126c994b0bd14384a215d86368957597e53'
            'ed16424d602cfa4be685b7e152928afdde26c0454738de70fa33cdca4d083ef4'
            '3c0212ca67f64e9618ea3a7b07eeaa56ca641c3f53605bf0f4bd962527c94bd5')

package() {
  cd "ProtonUp-Qt-$pkgver"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -Dm644 pupgui2/*.py -t "$pkgdir$site_packages/pupgui2/"
  python -O -m compileall "$pkgdir$site_packages/pupgui2/"

  cp -r share "$pkgdir/usr/"

  install -Dm644 "$srcdir/net.davidotek.$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm755 "$srcdir/pupgui2.sh" "$pkgdir/usr/bin/pupgui2"
}
