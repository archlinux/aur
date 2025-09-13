# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="rusticlone"
pkgver=1.5.0
pkgrel=2
pkgdesc="3-2-1 backups using Rustic and RClone"
url="https://github.com/AlphaJack/rusticlone"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python" "rclone>=1.67.0" "rustic>=0.10.0" "rustic<0.11.0" "python-importlib-metadata" "python-configargparse")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
# https://wiki.archlinux.org/title/Python_package_guidelines#Source
_real_url=$(curl -s "https://pypi.org/pypi/${pkgname}/${pkgver}/json" | jq -r '.urls[] | select(.packagetype == "sdist") | .url')
source=("${pkgname}-${pkgver}.tar.gz::${_real_url}")
b2sums=('d332fa91cd36791f23e34031aeab258e5b80ad4bd4f5cb802a3639bd5e18253170103137d7e142a0b9252a625de6e0bef374866ce08d97a1e1b4a708b98d8e7c')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 install -D -m 644 "README.md" -t "$pkgdir/usr/share/doc/rusticlone"
}
