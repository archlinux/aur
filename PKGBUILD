# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=androguard
pkgver=4.1.2
pkgrel=3
pkgdesc="Reverse engineering, Malware and goodware analysis of Android applications and more."
arch=('any')
url="https://github.com/androguard/androguard"
license=('Apache-2.0')
depends=('python' 'ipython' 'python-networkx' 'python-pygments'
         'python-lxml' 'python-colorama' 'python-matplotlib' 'python-asn1crypto'
         'python-click' 'python-pydot' 'python-mutf8' 'python-dataset'
         'python-frida' 'python-loguru' 'python-apkinspector'
         'python-pyaml' 'python-oscrypto')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-pyperclip: GUI'
            'python-pyqt5: GUI'
            'python-magic: magic'
            'python-filemagic: magic alternative'
            'python-sphinx: docs'
            'python-sphinx_rtd_theme: docs')
provides=('python-androguard')
conflicts=('python-androguard' 'python-androguard-git')
source=("https://github.com/androguard/androguard/archive/v$pkgver.tar.gz")
sha512sums=('c92965394e629662724a384ab63e5bc5c1d3273c7c8f8b01eff71d8d1d8734c35d31a4b50aef6963f607bcb4e823be156a27800a423f49fcf11580e907af6a45')

# https://wiki.archlinux.org/title/Python_package_guidelines
build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE-2.0
  mv "$pkgdir/usr/share/licenses/$pkgname/LICENCE-2.0" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
