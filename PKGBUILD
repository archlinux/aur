_npmname=jdrive
pkgname=nodejs-jdrive
pkgver=1.1.0
pkgrel=1
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/jdrive"
depends=(nodejs)
makedepends=(npm python2)
source=("jdrive.tgz::https://gitlab.com/mrvik/jdrive/-/jobs/artifacts/master/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('87a77c21480c541c5a078ec56af02d225321869e09eac3fcf4dea4d75afbe36569f7733f4271cb992c4b92324c60319587dd01c1bb1acf34bdcff65c166c50b2')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
