# Maintainer: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>
# Contributor: Asuka Minato <asukaminato at nyan dot eu dot org>

pkgname="llm"
pkgver=0.1.1
pkgrel=2
epoch=
pkgdesc="Run inference for Large Language Models on CPU, with Rust 🦀🚀🦙"
arch=(any)
url="https://github.com/rustformers/${pkgname}"
license=('MIT' 'APACHE')
depends=(glibc gcc-libs)
makedepends=(git cargo)
provides=(llm)
conflicts=(llm)
source=("git+${url}#v${pkgver}"
        "git+https://github.com/ggerganov/ggml"
        )
sha256sums=('SKIP' 'SKIP')


prepare() {
    cd "${srcdir}/${pkgname}"
    git submodule init
    git config submodule.crates/ggml/sys/ggml.url "${srcdir}/ggml"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "${srcdir}/${pkgname}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 target/release/llm -t "${pkgdir}/usr/bin/"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
