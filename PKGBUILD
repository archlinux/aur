# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=python-pyrogram-kurimuzon-git
provides=("${pkgname%-git}" python-pyrogram)
conflicts=("${pkgname%-git}" python-pyrogram)
replaces=(python-pyrogram) # pyrogram is dead
pkgver=2.1.14.r4350.3e4c3b9
pkgrel=2
pkgdesc="A for of Pyrogram, an elegant, modern and asynchronous Telegram MTProto API framework in Python for users and bots"
arch=("any")
url="https://github.com/KurimuzonAkuma/pyrogram"
license=("LGPL-3.0-or-later")
depends=("python" "python-pyaes" "python-pysocks")
optdepends=("python-tgcrypto: faster cryptography")
makedepends=("git" "python-build" "python-installer" "python-wheel" "python-setuptools")
checkdepends=("python-pytest" "python-pytest-asyncio" "python-pytest-cov")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "%s.r%s.%s" "$(grep __version__ pyrogram/__init__.py | cut -d '"' -f 2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname}"
  pytest
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
