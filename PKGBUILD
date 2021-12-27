# Maintainer: Nicholas Schlabach <Techcable at techcable dot net>
pkgname=zls-bin
pkgver="0.9.0"
pkgrel=2
pkgdesc="Zig Language Server, or zls, is a language server for Zig. Pre-compiled official binary."
arch=('x86_64')
url="https://github.com/zigtools/zls"
license=('MIT')
depends=('zig')
provides=('zls')
conflicts=('zls' 'zls-git')
replaces=('zls' 'zls-git')
# Gives a friendly recomendation to run `zls config`
install="zls.install"
# The MIT is considered a "custom" license, because it has a unique copyright line
#
# See the wiki for more info: https://wiki.archlinux.org/title/PKGBUILD#license
source=("zls-LICENSE.txt::https://raw.githubusercontent.com/zigtools/zls/0.9.0/LICENSE")
noextract=("zls-LICENSE.txt")
# This is the actual binary (everything except the license)
source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/zigtools/zls/releases/download/${pkgver}/${CARCH}-linux.tar.xz")
sha256sums=('39d99dfbe269e3daf483652bd925f4955e3b2a3d11fd737b538d366ef358c3ce')
sha256sums_x86_64=('f001967764565ab72e38c9320309fbbaf45f122ba01c80a2433b400f942bd18d')

package() {
    _output="${srcdir}"
    install -Dm755 "${_output}/bin/zls" "${pkgdir}/usr/bin/zls"


    # Install `build_runner.zig into the /usr/bin directory, alongside the executable.
    #
    # According to the README.md file, this is the default location.
    #
    # Prior versions of zls-bin manually modified the zls.json configuration to
    # move build_runner.zig into /usr/share instead of /usr/bin
    #
    # This was IMO not worth the complexity. We'll just keep it in /usr/bin
    install -Dm644 "${_output}/bin/build_runner.zig" "${pkgdir}/usr/bin/build_runner.zig"

    install -Dm644 "${_output}/README.md" "${pkgdir}/usr/share/zls/README.md"
    # Install license file
    install -Dm644 "${_output}/zls-LICENSE.txt" "${pkgdir}/usr/share/licenses/zls-bin/LICENSE"
}
