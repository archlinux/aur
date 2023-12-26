# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.1.4.0'
pkgrel=1
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('9009cb4a08972f1f1fd6fa9803b72bb33441a421fbc44bc1acaad231d33e77e3')
sha256sums_aarch64=('51a41e9eed14253999ae6dc85400e34d3990593dd8d182e332337ddfed4c9f3b')

package()
{
    # Pick the correct architecture
    architecture=$([[ -d ${srcdir}/Json2Sharp_linux-x64 ]] && echo 'x64' || echo 'arm64')

    # Install Json2Sharp
    install -Dm755 "${srcdir}/Json2Sharp_linux-${architecture}/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Clean up - Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-${architecture}.zip")"
}
