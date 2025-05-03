# Maintainer: Richard Garber <rg.1029384756@gmail.com>

pkgname=yaacs
pkgver=1.4.1
pkgrel=1
pkgdesc="Convert your Audiobooks to Opus in parallel"
url="https://github.com/rgarber11/yaacs"
arch=('any')
license=(MIT)
# NOTICE: The number of dependencies we rely on is *very high*. If the program does not run after an upgrade, make sure all your deps are upgraded, especially AUR deps!
depends=('python>=3.9' 'opustags' 'mkvtoolnix-cli' 'ffmpeg' 'python-packaging')

makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('034e4b9100fbb326966a9ef383239045dac7ab834d5015672f65421402ee7c5e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
