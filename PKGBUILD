# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Richard Jackson <rdjack21 at gmail dot com>
# Contributor: Emanuel Couto <emanuel dot amaral dot couto at gmail dot com>

pkgname='scenebuilder'
pkgver='8u51_b16'
pkgrel=1
pkgdesc='JavaFX visual layout tool that lets users quickly design JavaFX application user interfaces, without coding.'
arch=('any')
url='https://wiki.openjdk.java.net/display/OpenJFX/Main'
license=('BSD')
depends=('jdk8-openjdk' 'java-openjfx')
makedepends=('mercurial' 'apache-ant')
source=("scenebuilder::hg+http://hg.openjdk.java.net/openjfx/8u-dev/rt#tag=8u51-b16"
        "SceneBuilder"
       )
sha256sums=('SKIP'
            'af2f200569f3062a9f0239a4d20ef1e0e2e2eb6da99f2659dd7eb2a195480e9f')

prepare() {
    # Apply patches
    echo "${srcdir}"
    echo "${pkgname}"
    cd "${srcdir}/${pkgname}"
    ## patch -p1 < "${srcdir}/build.patch"
}

build() {
  # Links the properties file
  # Build scenebuilder
  cd "${srcdir}/${pkgname}/apps/scenebuilder"
  echo pwd
  ant -Dplatforms.JDK_1.8.home=/usr/lib/jvm/default jar-sb
}

package() {
    local appdir="usr/share/java/scenebuilder"
    local builddir="${srcdir}/${pkgname}/apps/scenebuilder/SceneBuilderApp/dist"
    local buildkitdir="${srcdir}/${pkgname}/apps/scenebuilder/SceneBuilderKit/dist"

    mkdir -p "${pkgdir}/${appdir}/lib"
    mkdir -p "${pkgdir}/usr/bin"

    install -m644 "${builddir}"/*.* "${pkgdir}/${appdir}"
    install -m644 "${buildkitdir}"/*.* "${pkgdir}/${appdir}"
    install -m755 "${srcdir}/SceneBuilder" "${pkgdir}/usr/bin"

}
