# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>

pkgname=pqp
pkgver=1.3
pkgrel=1
pkgdesc="A library for performing proximity queries on a pair of geometric models composed of triangles"
arch=('i686' 'x86_64')
url="http://gamma.cs.unc.edu/SSV/"
license=('Custom')
source=(http://gamma.cs.unc.edu/software/downloads/SSV/${pkgname}-${pkgver}.tar.gz
        LICENSE
        fpic.patch)
md5sums=('f710e24a62db763d61d08667439d46fd'
         'a84efad9de33fd28444fa14f9bd7d273'
         '4bc614687ef5b95df3b9be31ca46c662')
sha256sums=('00bdcb380206393349ed7ee9a773f894bf796059c66cec0d97c0a93649eb012f'
            '15a28f160c5961b29511b77ead4528755b55dd5a4aa0adc8dfe735db8a03cca4'
            'ec28121b428b14940a3a19386d889ad1d21f6156d3e7bced764e75ac071e3bd6')
sha384sums=('064b080711c5f8303401eee018175aa552280ee64a37115a3e3e9eaabc312fc55a9d31d97ade872c95cb646798618cde'
            '86b1dac77fefd183350f142ed3f92314cb67276bc1c00526e24d8346d8a8f681748c2abb7daf78f8e440e187ee4e7277'
            '4bd6e785eea4d3c01712aa9a6c9d1f2a6da8994a1c7af87a4d8b767f74726055bdc50dd68ff22d4242e88be7849e144f')
sha512sums=('baad7b050b13a6d13de5110cdec443048a3543b65b0d3b30d1b5f737b46715052661f762ef71345d39978c0c788a30a3a935717664806b4729722ee3594ebdc1'
            '9b363188ee38fb9aa7d2d7ed25017f8da361156e651f91a61733055e4d1be3ca57e418584a33b8dcb0875ef50b3889235b042bafe71cf7c83fb0d79879f6f744'
            '50004c678c0ce51e4511d392572a65789f8cfacde8d5cbc9f6a607f79aac74cb3a94dbd8b08f11b86f37fd6b38e0f36207e078afb72dbb1c552d9bcd5d7c07bc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/PQP_v1.3"
	
  patch -p2 < ${srcdir}/fpic.patch
	
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/PQP_v1.3"
	
  install -dm755 "${pkgdir}/usr/include/"
  install -dm755 "${pkgdir}/usr/lib/"
	
  install include/* "${pkgdir}/usr/include/"
  install lib/libPQP.a "${pkgdir}/usr/lib/"
	
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

