# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.2.0.0'
pkgrel=1
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('e487b84e2482fe76caa65caeb01818ad278d93d0adbd088ab875a2853909a7fe')
sha256sums_aarch64=('45ac81c140277d8b5de54370605ceb224ee71a8d0f72042a13a0cd32fef994e0')

package()
{
    # Pick the correct architecture
    architecture=$([[ -d ${srcdir}/Json2Sharp_linux-x64 ]] && echo 'x64' || echo 'arm64')

    # Install Json2Sharp
    install -Dm755 "${srcdir}/Json2Sharp_linux-${architecture}/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Clean up - Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-${architecture}.zip")"
}
