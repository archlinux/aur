
# Maintainer: Eduard Wirch <wirch.eduard@gmail.com>
# Contributor: Martin Lukes <martin.meridius@gmail.com>

_appname=smartgit
pkgname=${_appname}_preview
pkgver=20.1_preview_9
pkgrel=1
pkgdesc="Graphical Git client. Preview version."
arch=("any")
url="https://www.syntevo.com/smartgit/preview/"
license=('custom')
depends=("java-environment>=11" "python3")
optdepends=("mercurial: hg repositories support"
            "git: git repositories support")
makedepends=("tar")
replaces=("smartgithg")
conflicts=("smartgit")
provides=("smartgit")

# package version as it appears in the name of tar.gz archive file
_pkgver=${pkgver//_/-}
_pkgver=${_pkgver//./_}

source=("https://www.syntevo.com/downloads/smartgit/${_appname}-${_pkgver}.deb")
sha1sums=('7ade87102b97afb9d7181b699359f4f0560f2ea3')

package() {
    cd "$srcdir"

    tar -xzf data.tar.gz -C "${pkgdir}"

    # Unbundle JRE
    rm -rf "${pkgdir}/usr/share/${_appname}/jre"

    # License
    install -Dm644 "$pkgdir/usr/share/doc/$_appname/license.html" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
