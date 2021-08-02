# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7213.2021.0526.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)
source=('LICENSE')
sha512sums=(8eb670337568d49fa38f4888826db827e6460079f35a81e30f430bfc11df43562c3a4095980266e6ed9372467e3655bd0d699d7618b4798a7f1b25a835983073)
b2sums=(7a5866d947d40a1c993795f96f87ba94cdefa572fc5524848316792b602bdfd1ad50c639f33b1e72dd97e739c7f7312a8f2efd086aab9be4b5fe4f0790ba37a5)
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://f5vpn.geneseo.edu/public/download/linux_f5cli.x86_64.deb")
sha512sums_x86_64=(ed62647bc14ec186226970eef201474d516f8646add0aa292d8fd63c3bd84f0e0e366320ae3d8089dc582e25513e7caa05410c9a79d07025eacc2812ba4e699c)
b2sums_x86_64=(4eaa3ceab45bc4eee60f75565e03a64e6197dcb7df042ee5f7d12ea4ae8abbbe015fe9d0ceb97491b83e26c56d0fdc7ffa1ccd9b9504c1f3e9275e75ab0607b5)
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://f5vpn.geneseo.edu/public/download/linux_f5cli.armhf.deb")
sha512sums_armv7h=(e8ab78264df37f0b464865052ca43643873d25768b8318628a9b4657c8c07948ed7f8f156f0e6ce4ca1e575a41f5870ef09454fcd0ec58a9fe86b8caba6805c2)
b2sums_armv7h=(5ef7be9d67efde900c2595b30869e095ca3690b9a8abf220fb9125ed65921259c4bc4475cce36ea7681910eba7d2d3b9001f5ea7036d8635aa26677a8c873087)
depends=(openssl)
makedepends=(tar)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

package() {
  tar -xf data.tar.gz
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid

  rm -r "${srcdir}/usr/local/bin"

  if [[ "$CARCH" == armv7h ]]; then
    suffix=armhf
  else
    suffix="$CARCH"
  fi

  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}"/usr/bin/${pkgname}
  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}"

  cp -a usr "${pkgdir}"
}
