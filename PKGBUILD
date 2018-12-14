_npmname=jdrive
pkgname=nodejs-jdrive
pkgver=1.1.0
pkgrel=1
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/jdrive"
depends=("nodejs>=10")
makedepends=(npm python2)
source=("jdrive.tgz::https://gitlab.com/mrvik/jdrive/-/jobs/artifacts/master/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('adb7a077617679cd4e8635cdadb39bd2a416db9d94e5bdd2a53b8cd037b2d4a5fcbbc37f870db7894bb20d0db8efeae529068a5cf5c586f74aacb48943f05072')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
