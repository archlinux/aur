pkgname=ntfs3-dkms
pkgver=0.0.0
pkgrel=1
pkgdesc="NTFS3 is fully functional NTFS Read-Write driver developed by Paragon Software."
arch=('any')
url='https://www.paragon-software.com/'
license=('GPL2')
depends=('dkms')
options=('!strip')
source=("https://dl.paragon-software.com/ntfs3/ntfs3.patch"
        Makefile.patch
        dkms.conf)
sha512sums=('a08df1ee6c1f8169fcac6ed0e0065a7d1fc7008cc8ec7c581a95228190ce36b1970a9c9285ba80f486a3db61de6587f6bf1e7b2a6709b2432ab2158f81b466fc'
            'bcadd7d0904ed786f71abeac56f62a02260b9dab08ff25902bf857b66aef6949d9061865c0fc0d9dbbd038ce5e595ab8f07c0779fefc1ecd7cf544816f564247'
            '251f042d3028b57ff845aec175e5e9d6c35758a34c858ed479e64667caa93458791e0f63dda350a34c05655bb75600ceccdd3a21d66583b0abe29b62505ab934')

prepare() {
  mkdir -p ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -p3 -N -f -i ../ntfs3.patch || true
  patch -p1 -N -i ../Makefile.patch
}

package() {
  mkdir -p "${pkgdir}/usr/src"
  cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/src/ntfs3-${pkgver}"
  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/ntfs3-${pkgver}/dkms.conf"
}
