# Maintainer: Thomas Fanninger <thomas@fanninger.at>

HOST_ARCH=$(uname -m)
if [ $HOST_ARCH == "i686" ] || [ $HOST_ARCH == "i386" ]
then
    NORM_ARCH="x86"
elif [ $HOST_ARCH == "x86_64" ]
then
    NORM_ARCH="x86_64"
elif [[ $HOST_ARCH =~ .*(arm).* ]]
then
    NORM_ARCH="arm"
fi

pkgname=caddy-filemanager-standalone
pkgver=1.0.0
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app. - Standalone version"
arch=('any')
url="https://github.com/hacdias/filemanager"
license=("Apache")
depends=()
makedepends=("git")
backup=('etc/caddy-filemanager-standalone/config.json')

source=('caddy-filemanager-standalone.service'
        'config.json'
        'LICENSE')
sha512sums=('9a943a8206b4cc162631ca76ac7c737c25330ce5310a331a648d37d27abffc5ec34605bbcee35fefa957317254fea22012a6a11dd848d6b888ff8889fba3dd91'
            '25aa6206c9958d25cc624b8f11ab2e4b1fb6c9dac4e1ea994ea15aa6fadb7fdf805fd82f8ce349b7283222ebb93ac1fbea83f9367762e5a5ed40f4b8c5680355'
            '477fb6a7b187ff3d043b413022c3aaa7ef83fb8edf026f25efc3c6f032afdb4b2ee0c2028e4c70a0769d1f1cba78d10eeb284b2a70ebf4c171540a1d7aac6bbd')

source_x86_64=("${pkgname}::https://github.com/hacdias/filemanager/releases/download/v${pkgver}/linux-amd64-filemanager")
sha512sums_x86_64=('3fa93662b6aa7ab7d6b2a3017ccbdec009e5efa72db26083689e2ba43bec9aa86922e08be79065ad40aeed8e64d89038edd84b89c1da997c467041e5866cfedd')

source_x86=("${pkgname}::https://github.com/hacdias/filemanager/releases/download/v${pkgver}/linux-386-filemanager")
sha512sums_x86=('b113ed904df0c7182dfb8472b5859001e6a9c875df62e07a6b617d77095f161eb23c31d585a6acc9e087545abb19c37933cc0445480e8c1c4441d3ea257f2ada')

source_arm=("${pkgname}::https://github.com/hacdias/filemanager/releases/download/v${pkgver}/linux-arm-filemanager")
sha512sums_arm=('d4b335f2634eceddb7f5ed735fe11824a77d9dea9aad39b43160d9a435078bdedad04701ba20b802ec8b6701daaf5129221a44cc6358c4bc0b1b0e79d3b99be8')

options=('!strip' '!emptydirs')

package() {
  install -D -m 0600 "${srcdir}/config.json" "${pkgdir}/etc/${pkgname}/config.json"
  install -D -m 0600 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m 0755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  install -D -m 0644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
