_npmname=jdrive
pkgname=nodejs-jdrive
pkgver=1.2.0
pkgrel=1
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/jdrive"
depends=("nodejs>=10")
makedepends=(npm python2)
source=("jdrive.tgz::https://gitlab.com/mrvik/jdrive/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('cbf3a96ef97f29b8a0f98dc00f4604a8e0d48e09f917dfd28703db6e763007e6baa1c6489da8e65cb007bf22c3a8a1cb5d3f2c39e4412d8ba34356abfd06bcf5')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
