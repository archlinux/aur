# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>
pkgname=heroku-cli
pkgver=6.13.19
pkgrel=3
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('i686' 'x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
optdepends=('git: Deploying to Heroku')
provides=('heroku-cli')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
source_x86_64=('https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x64.tar.gz')
source_i686=('https://cli-assets.heroku.com/heroku-cli/channels/stable/heroku-cli-linux-x86.tar.gz')
md5sums_i686=('2862a4017d88cf4794c67219af8978b4')
md5sums_x86_64=('6260a8dc2bd0002b75b4b23d8bebd3f9')

prepare() {
    cd "${srcdir}"
    dir=$(find . -type d -regextype sed -regex ".*/heroku-cli-.*" | head -n1)
    mv $dir heroku-cli
}

package() {
    cd "${srcdir}"

    install -dm 755 "${pkgdir}"/opt
    install -dm 755 "${pkgdir}"/usr/bin
    install -Dm 644 heroku-cli/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mv heroku-cli "${pkgdir}"/opt/heroku-cli
    ln -s /opt/heroku-cli/bin/heroku "${pkgdir}"/usr/bin/heroku
}
