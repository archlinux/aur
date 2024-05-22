# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.1.10.0'
pkgrel=1
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('69b6bc0b634c28a8356123faa3f9e043cb57ccd71f606ddc16066ec7d1ca67ae')
sha256sums_aarch64=('6c3cd232f79f4fd692afb536eea8c0ed02075685f00a30b9b32ae55212480b0e')

package()
{
    # Pick the correct architecture
    architecture=$([[ -d ${srcdir}/Json2Sharp_linux-x64 ]] && echo 'x64' || echo 'arm64')

    # Install Json2Sharp
    install -Dm755 "${srcdir}/Json2Sharp_linux-${architecture}/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Clean up - Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-${architecture}.zip")"
}
