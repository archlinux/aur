# Maintainer: Víctor González <mrvikxd@gmail.com>
_npmname=jdrive
pkgname=nodejs-jdrive
pkgver=2.0.0
pkgrel=1
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/jdrive"
depends=("nodejs>=10")
license=("GPL2")
makedepends=(npm python2)
source=("jdrive.tgz::https://gitlab.com/mrvik/jdrive/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('9f284fb1d9756952cf40ad9fbdc1136053fb420446996b8723bf10b6952c0652f67a154ac53a2e948f826d964d8f476c798edcc41fc487bbe18c6028a0984b3c')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
