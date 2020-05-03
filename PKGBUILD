# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=quakejs-git
pkgver=1
pkgrel=3
pkgdesc="Port of ioquake3 to JavaScript with the help of Emscripten"
arch=('any')
url="https://github.com/inolen/quakejs"
license=('unknown')
depends=('nodejs')
makedepends=('npm')
options=('!strip')
source=('git+https://github.com/inolen/quakejs.git'
	'server.cfg'
	'web.json'
	'quakejs-cdn.service'
	'quakejs-ds.service'
	'quakejs.sysusers')
sha512sums=('SKIP'
            'f9fc1684e9a2e3f992a59dad204b9deea8a9878953ff9b80dd1fb0ffde9f1d12efdb462a87b3c94b7fcfdef630911eddf5743ec7c7df445e6749cc7d163ce86a'
            '41ce94ad41123ae4892089f82569b480af926702b482707f96728eb4fe6f50b69e84827f80c3014eab343f756f2fba5a0c2e6b7720f094e04bef6009589005da'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e'
            'a7cc7ec2d2cfda5d5b71490b9f2b06fb859bca6a77216a35b536caa09a4e523a7e976339a2f75b0d38ea70e17dd1f5bec3f30fc51fadca9c474f90dbdc7b60d2')

build() {
  cd "${srcdir}/quakejs"
  git submodule update --init
  npm install --cache "${srcdir}/npm-cache"
}

package() {
  install -d "${pkgdir}/etc/webapps/quakejs"
  install -d "${pkgdir}/usr/share/webapps"
  cp -ra "${srcdir}/quakejs" "${pkgdir}/usr/share/webapps/quakejs"

  install -Dm 644 "${srcdir}/quakejs-cdn.service" "${pkgdir}/usr/lib/systemd/system/quakejs-cdn.service"
  install -Dm 644 "${srcdir}/quakejs-ds.service" "${pkgdir}/usr/lib/systemd/system/quakejs-ds.service"
  install -Dm 644 "${srcdir}/quakejs.sysusers" "${pkgdir}/usr/lib/sysusers.d/quakejs.conf"
}
