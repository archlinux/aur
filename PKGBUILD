# Maintainer: poly000 <1348292515@qq.com>
pkgname=doukutsu-save-editor
_pkgname=doukutsu-save-editor-rs
pkgver=0.1.5
pkgrel=2
pkgdesc="Save Editor for Cave Story in rust with egui"
url="https://github.com/poly000/$_pkgname"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')

_commit='35ec388'
source=("git+https://github.com/poly000/$_pkgname.git#commit=$_commit")
sha256sums=('SKIP')

license=('mit')
depends=(
    'libxcb'
    'libxkbcommon'

    'gtk3'
    'glib2'

    'gcc-libs'
    'glibc'
    
    'at-spi2-core'
)
optdepends=(
    'libspeechd: Screen Reader'
)
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
