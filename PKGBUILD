# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.1.10.0'
pkgrel=2
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('fe8965943f3f6a05f8da91e2daf64cd438cc5c2356ed8890e63d7d57f8e15dda')
sha256sums_aarch64=('ed526211fdf177d1fd0eec861063c204cc60c31fb4498ee3517a2a347aefed8f')

package()
{
    # Pick the correct architecture
    architecture=$([[ -d ${srcdir}/Json2Sharp_linux-x64 ]] && echo 'x64' || echo 'arm64')

    # Install Json2Sharp
    install -Dm755 "${srcdir}/Json2Sharp_linux-${architecture}/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Clean up - Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-${architecture}.zip")"
}
