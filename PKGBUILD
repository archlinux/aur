# Maintainer: Zach Hoffman <zrhoffman@apche.org>
pkgname=f5fpc
pkgver=7214.2021.0915.1
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(x86_64 armv7h)
source=('LICENSE')
sha512sums=(8eb670337568d49fa38f4888826db827e6460079f35a81e30f430bfc11df43562c3a4095980266e6ed9372467e3655bd0d699d7618b4798a7f1b25a835983073)
b2sums=(7a5866d947d40a1c993795f96f87ba94cdefa572fc5524848316792b602bdfd1ad50c639f33b1e72dd97e739c7f7312a8f2efd086aab9be4b5fe4f0790ba37a5)
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://vpn.f5.com/public/download/linux_f5cli.x86_64.deb")
b2sums_x86_64=(478d6ce80ebfa90efd9193ddfedba7df36222bb29eafc137ba2393a4bc8cfd5cd3827df5bbe718374156fed91bff9b50be5e44dd185478c46ed54e97ae1f544c)
sha512sums_x86_64=(6a7bda860569b9a00e62d019743f0f9df664a3abf468dc8833c330107f74d2ea3efbcaff163066e2832047f68ac6a5cb9c4c2af3e608fc5e50570b611a53e758)
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://vpn.f5.com/public/download/linux_f5cli.armhf.deb")
b2sums_armv7h=(5daa79b0222f216ea7869919d73014449f1ffeeb010bbd139ddd39bb1faf41bf4dd63d0e240e936b2c8fe99021099f9365da525bebe30888ee481874be420bd4)
sha512sums_armv7h=(be76ad80f7a8d2cc034a81caf94b7e1459e2667370e6277b6d7e421a92a0de8d004b25d6f7e5592fd76c03a03bba08f616162740a77d7e5850430657cde0420d)
depends=(openssl)
conflicts=('f5vpn<7213.2021.0526.1-2')
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

package() {
  tar -xf data.tar.gz
  install -dm755 "${pkgdir}/usr/bin/"

  rm -r "${srcdir}/usr/local/bin"

  if [[ "$CARCH" == armv7h ]]; then
    suffix=armhf
  else
    suffix="$CARCH"
  fi

  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}"
  ln -s "/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}" "${pkgdir}/usr/bin/svpn"
  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a usr "${pkgdir}"
}
