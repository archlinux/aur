# Maintainer: Rhys Kenwell <redrield+aur@gmail.com>

pkgname=heroku-cli
pkgver=7.7.6
_builddir=cli-${pkgver}
pkgrel=1
pkgdesc="a tool for creating and managing Heroku apps from the command line"
arch=('x86_64')
url="https://devcenter.heroku.com/articles/heroku-cli"
license=('custom' 'ISC')
optdepends=('git: Deploying to Heroku')
provides=('heroku-cli')
conflicts=('heroku-cli' 'heroku-client-standalone' 'heroku-toolbelt' 'ruby-heroku')
makedepends=(npm)
source=("https://github.com/heroku/cli/archive/v7.0.98.tar.gz")

build() {
    cd "${srcdir}/${_builddir}"
    npm install
    npm run build
}

package() {
    # Get rid of git repo cruft that isn't needed at runtime
    cd "${srcdir}/${_builddir}"

    rm -r .circleci .editorconfig .eslintignore .eslintrc .gitattributes \
        .github .gitignore .gitmodules .lintstagedrc .prettierrc appveyor.yml \
        CHANGELOG Dockerfile docs install-standalone.sh install-ubuntu.sh package-lock.json \
        RELEASE.md scripts snap src test tsconfig.json tslint.json

    cd ${srcdir}

    install -dm755 "${pkgdir}/opt"
    install -dm755 "${pkgdir}/usr/bin"
    install -Dm644 ${_builddir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -R "${_builddir}" "${pkgdir}/opt/heroku-cli"
    ln -s /opt/heroku-cli/bin/run "${pkgdir}/usr/bin/heroku"
}

#    install -dm 755 "${pkgdir}"/opt/
#    install -dm 755 "${pkgdir}"/usr/bin
#    install -Dm 644 heroku/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#
#
#    cp -R "heroku" "${pkgdir}"/opt/heroku-cli
#    ln -s /opt/heroku-cli/bin/heroku "${pkgdir}"/usr/bin/heroku
md5sums=('fb109a5a7dfededc4ea765f8db8b6b3f')
