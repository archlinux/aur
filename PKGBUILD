# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>
# Based on heroku-cli by Rhys Kenwell <redrield+aur@gmail.com>

pkgname=heroku-cli-nightly
pkgver=6.14.20.737bba7
pkgrel=1
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('i686' 'x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
optdepends=('git: Deploying to Heroku')
provides=('heroku-cli')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source_x86_64=('heroku-cli-linux.tar.gz::https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz')
source_i686=('heroku-cli-linux.tar.gz::https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x86.tar.gz')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')

pkgver() {
	tar --exclude="*/*" -tf heroku-cli-linux.tar.gz | sed 's|heroku-cli-v\(.*\)-linux-x64/|\1|;s/-/./'
}

package() {
    cd "${srcdir}"
	dir="$(find . -type d -regextype sed -regex ".*/heroku-cli-.*" | head -n1)"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    install -Dm 644 "${dir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cp -r "${dir}" "${pkgdir}"/opt/heroku-cli
    ln -s /opt/heroku-cli/bin/heroku "${pkgdir}"/usr/bin/heroku
}
