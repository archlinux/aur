# Maintainer: moyigeek <moyi@openatom.club>

pkgname=atomgit-cli-bin
pkgver=0.7.4
pkgrel=1
pkgdesc="AtomGit CLI (ag-cli) - 基于 AtomGit API 的命令行工具，参考 GitHub CLI (gh) 开发 (binary release)"
arch=('x86_64' 'aarch64' 'loong64')
url="https://atomgit.com/hust-open-atom-club/atomgit-cli"
license=('custom:MulanPSL-2.0')
provides=('ag-cli')
conflicts=('ag' 'ag-cli' 'atomgit-cli')
_sha256sums_x86_64='d6ba2bc31bfd450d75acfa81defae8bbd07849ff84f9964db06f67f661de419b'
_sha256sums_aarch64='4c94394b42580f31feb97ef870e52421d95a9849882aa71b48f0fbec7073b444'
_sha256sums_loong64='6cb9e9e3af2a545ead468b55fe51a54155255020af9c1b9e8c87af58c08d0c84'

case "$CARCH" in
    x86_64)  _arch=amd64   ;;
    aarch64) _arch=arm64   ;;
    loong64) _arch=loong64 ;;
    *) _arch=unknown ;;
esac

source=("https://atomgit.com/hust-open-atom-club/atomgit-cli/releases/download/v${pkgver}/ag_linux_${_arch}.tar.gz")

case "$CARCH" in
    x86_64)  _sha256=$_sha256sums_x86_64 ;;
    aarch64) _sha256=$_sha256sums_aarch64 ;;
    loong64) _sha256=$_sha256sums_loong64 ;;
    *) _sha256=SKIP ;;
esac
sha256sums=("$_sha256")

package() {
    cd "${srcdir}"
    install -Dm755 "ag-cli" "${pkgdir}/usr/bin/ag-cli"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 share/man/man1/*.1 -t "${pkgdir}/usr/share/man/man1/"
}
