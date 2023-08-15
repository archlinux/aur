# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=inethi-bin
pkgver=1.0.0
pkgrel=2
pkgdesc="A GUI installer that can set up the iNethi Docker environment."
arch=('aarch64' 'x86_64')
url="https://www.inethi.org.za/software/"
_githuburl="https://github.com/iNethi/inethi-network-builder"
license=("custom")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('nss' 'python-yaml' 'alsa-lib' 'at-spi2-core' 'libcups' 'python-platformdirs' 'python-pygments' 'libdrm' 'python' 'gtk3' 'libxcomposite' \
    'python-typing_extensions' 'nspr' 'python-attrs' 'nodejs' 'libxdamage' 'cairo' 'bash' 'libx11' 'pango' 'dbus' 'python-six' 'glib2' 'glibc' \
    'python-pytz' 'libxcb' 'python-ptyprocess' 'python-pillow' 'expat' 'python-keyring' 'python-pexpect' 'libxkbcommon' 'gcc-libs' 'libxfixes' \
    'libxrandr' 'python-docutils' 'python-packaging' 'mesa' 'python-importlib-metadata' 'python-setuptools' 'python-lockfile' 'libxext' \
    'python-cryptography' 'python-trove-classifiers')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums_aarch64=('6ccffaef7386164275c64a8457f72c4f1f78adc687bd72346a74ba7e42579e00')
sha256sums_x86_64=('0fdf6235453d4396444a972309fc7dc70fe54218a17d21767ffad41d49d45c9f')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm755 -d "${pkgdir}/opt" "${pkgdir}/usr"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}" "${pkgdir}/opt"
    cp -r "${srcdir}/usr/share" "${pkgdir}/usr"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/${pkgname%-bin}/resources" -type f -exec chmod 644 {} \;
    sed "s|Exec=${pkgname%-bin}|Exec=/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}