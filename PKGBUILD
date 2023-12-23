# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.1.1.0'
pkgrel=2
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('d970c0490b40e8995dc592737454e55a2594dba990590711bbc59166841e65cc')
sha256sums_aarch64=('da9353e7139cb2b254e20c509f1e292c3a4dccdbf985ea87981a36efcc6c3a24')

package()
{
    # Pick the correct architecture
    architecture=$([[ -d ${srcdir}/Json2Sharp_linux-x64 ]] && echo 'x64' || echo 'arm64')

    # Install Json2Sharp
    install -Dm755 "${srcdir}/Json2Sharp_linux-${architecture}/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Clean up - Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-${architecture}.zip")"
}
