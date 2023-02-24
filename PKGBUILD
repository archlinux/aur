# Maintainer: poly000 <1348292515@qq.com>
pkgname=doukutsu-save-editor
_pkgname=doukutsu-save-editor-rs
pkgver=0.1.3
pkgrel=1
pkgdesc="Save Editor for Cave Story in rust with egui"
url="https://github.com/poly000/$_pkgname"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

_commit='f6c6c26208f440781b53dc3018ebdf5c4baa0360'
source=("git+https://github.com/poly000/$_pkgname.git#commit=$_commit")
sha256sums=('SKIP')

license=('mit')
depends=('libxcb' 'libspeechd' 'libxkbcommon' 'gtk3' 'at-spi2-core')
makedepends=('cargo' 'openssl')

build() {
    cd "$srcdir/$_pkgname"

    if [[ $CARCH != x86_64 ]]; then
        export CARGO_PROFILE_RELEASE_LTO=off
    fi

    cargo build --locked --release --target-dir target
}

package() {
   cd "$srcdir/$_pkgname"
   install -Dm755 target/release/doukutsu-save-editor ${pkgdir}/usr/bin/doukutsu-save-editor
}
