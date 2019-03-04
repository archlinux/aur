# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive
pkgver=2.1.2
pkgrel=2
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/${pkgname}"
depends=("nodejs>=10")
license=("GPL2")
provides=("jdrive")
replaces=("nodejs-jdrive")
conflicts=("nodejs-jdrive")
makedepends=(npm python2)
optdepends=(
    "jdrive-client: See JDrive progress using JDrive socket"
)
source=("jdrive.tgz::${url}/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('542b190b39a347ad40bb0e88e2ed419f299a1eb4c2806ff2d364ee3dbfc117d7085371480e8fabf5a7ddc97ae96a16500dc87869a52c703f8eec24093d9cbe56')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
