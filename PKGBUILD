# Python package author: Daniel Kantor <git@daniel-kantor.com>
pkgname=python-seagoat
pkgver=0.2.0
pkgrel=1
pkgdesc="A semantic-code search engine"
arch=(any)
url="https://aur.archlinux.org/packages/python-seagoat"
license=(MIT)
makedepends=("python" "python-pip")
depends=("python")
checkdepends=(
    "python-appdirs"
    "python-click"
    "python-pygments"
    "python-typing-extensions"
    "python-gitpython"
    "python-tqdm"
    "python-nest_asyncio"
    "python-blessed"
    "python-prompt-toolkit")

build() {
  pip install --no-deps --target="$srcdir/seagoat" seagoat==$pkgver
}
package() {
  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  mkdir -p "$pkgdir/$sitepackages"
  cp -r "$srcdir/seagoat/seagoat" "$pkgdir/$sitepackages"
  
  install -Dm755 "$srcdir/seagoat/bin/gt" "$pkgdir/usr/bin/gt"
  install -Dm755 "$srcdir/seagoat/bin/seagoat" "$pkgdir/usr/bin/seagoat"
  install -Dm755 "$srcdir/seagoat/bin/seagoat-server" "$pkgdir/usr/bin/seagoat-server"
}

