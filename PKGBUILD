#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=reflector
pkgver=2023
pkgrel=2
pkgdesc='A Python 3 module and script to retrieve and filter the latest Pacman mirror list.'
arch=(any)
license=(GPL2)
url="https://xyne.dev/projects/reflector"
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('rsync: rate rsync mirrors')
backup=(etc/xdg/reflector/reflector.conf)
source=(https://xyne.dev/projects/reflector/src/reflector-2023.tar.xz{,.sig})

sha512sums=('11aec550c15080695525409f11eae6d4b545df8b37a8e0727de939eefec2b2fa6aa95c5c3500a6c8a940b6060cdaf2526430ed47e01a3c6f098e1b77189eb479'
            'SKIP')
b2sums=('24ee3610eb94e4412bceba40f4763def380028683358cb1016546a4d0bb12eaa69aba4e83b7998ebb74ee6f025f9f342901d076e44302da47d0ed14b727fb9c1'
        'SKIP')
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package ()
{
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  install -Dm644 'reflector.service' "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -Dm644 'reflector.timer' "$pkgdir/usr/lib/systemd/system/reflector.timer"
  install -Dm644 'reflector.conf' "$pkgdir/etc/xdg/reflector/reflector.conf"
}


# vim: set ts=2 sw=2 et:
