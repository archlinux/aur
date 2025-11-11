# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=androguard
pkgver=4.1.3
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
sha512sums=('a01c0f31d18704e9bfab036185b9d3318c33c963f7dde66a9b53326325a5833f5248047b521b9d71a4cada68b27c2b6f9b3055aeac49a3bbea67b8e0829cc1ab')

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
