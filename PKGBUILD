_npmname=jdrive
pkgname=nodejs-jdrive
pkgver=1.1.0
pkgrel=2
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/jdrive"
depends=("nodejs>=10")
makedepends=(npm python2)
source=("jdrive.tgz::https://gitlab.com/mrvik/jdrive/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('b89814debec42195bccaa3f4f75f05f40400af12089a2cca6a2a2344e9d76915ec0bb79195c4ee117ace2a6a53f6c07e58b64daf2390cb0578ca87caafd09987')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
