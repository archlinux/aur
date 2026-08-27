# Maintainer: Gabriel Chamon <gchamon@tuta.io>
pkgname=archie-cli-nightly
pkgver=0.1.0a284
pkgrel=1
_commit=6133cc881b45875fb8472378a8ec2bfd3193f907
pkgdesc="Repository-owned maintenance CLI for Archie, nightly alpha build"
arch=(any)
url="https://gitlab.com/gabriel.chamon/archie"
license=(MIT)
depends=("python>=3.14")
makedepends=(python-installer uv)
provides=(archie)
conflicts=(archie archie-cli)
source=("archie-${_commit}.tar.gz::https://gitlab.com/gabriel.chamon/archie/-/archive/${_commit}/archie-${_commit}.tar.gz")
sha256sums=('b61ae459a7be12eade00036a0571846fdc614ea829eabe8009235a857a726e2b')

build() {
    cd "$srcdir/archie-$_commit"
    uv build --wheel --out-dir "$srcdir/dist"
}

package() {
    cd "$srcdir/archie-$_commit"
    python -m installer --destdir="$pkgdir" "$srcdir"/dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 docs/user/KEYBOARD_SHORTCUTS.md "$pkgdir/usr/share/doc/$pkgname/KEYBOARD_SHORTCUTS.md"
    install -Dm644 deployment-packages/local/lib/zsh/README.md "$pkgdir/usr/share/doc/$pkgname/ZSH_COMMANDS.md"
    install -Dm644 packaging/archie-cli/_archie "$pkgdir/usr/share/zsh/site-functions/_archie"
}
