# Maintainer: wszqkzqk <wszqkzqk@qq.com>

pkgname=linsys2
pkgver=r27.20260508.9816a1a
pkgrel=1
pkgdesc='Build, debug, and run Windows programs on Linux with the full MSYS2 ecosystem. No VM. No dual-boot. No containers.'
arch=('x86_64' 'aarch64' 'riscv64' 'loong64')
url='https://github.com/wszqkzqk/LinSYS2'
license=('GPL-2.0-or-later')
depends=('bash' 'coreutils' 'curl' 'gawk' 'gettext' 'glibc' 'gnupg' 'gpgme' 'grep' 'libarchive' 'openssl' 'which' 'bzip2' 'xz' 'zstd' 'wine' 'python')
makedepends=('git' 'meson' 'ninja' 'asciidoc' 'doxygen' 'gcc' 'patch')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s.%s" \
        "$(git rev-list --count HEAD)" \
        "$(git log -1 --format=%cd --date=format:%Y%m%d)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
