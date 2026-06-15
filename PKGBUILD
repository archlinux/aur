# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=androguard
pkgver=4.1.4
pkgrel=1
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
sha512sums=('cf8edaab34d3896c56ef1805a17594573a200b009e50e494fe1e9e016f0c462bea90a8de77b9c29576380777fbae5b6db27917a9d09d8b5db6e4de7bdbf9d36c')

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
