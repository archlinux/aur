# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui-bin'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=4
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')
optdepends=('caddy: Web server to serve files' 'nginx: Web server to serve files')

provides=('concrnt-webui')
conflicts=('concrnt-webui')

source=("ccweb-${pkgver}::https://github.com/totegamma/concurrent/releases/download/${_pkgver}/web.zip"
        # v1.6.0 release tarball does not yet contain LICENSE file
        "https://raw.githubusercontent.com/totegamma/concurrent/refs/heads/develop/LICENSE"
        "Caddyfile"
        "nginx.conf"
        "concrnt-webui-caddy.service"
        "concrnt-webui-nginx.service"
        "concrnt-webui.hook"
        "concrnt-webui.tmpfiles")

sha512sums=('ea478f9011f44c8e92554bc50389cc7de9fcb0e464d5cbb4882215a2f43c438ce964a3c024a25490e2a375bfd0671d132c96c42a432dceb96d80d1a841af592e'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '2fb5bdae2bcdcf49ee4ff6bbfafd502b68c3d3942af36edebfa5baeff74db093d684ef4980e9f5f8eca2d531c7a41042706d223c893d1d0550b99410e1c9f25c'
            'a94c0f90ace2647bb4bc1242408dc73da581c8c9cf3f6aef8ccfbf24b85c5fc71fb778ea50b77f63efed2fcef96bef423fb7380e374cdf95a7f1e23344743796'
            '62075b7e1a0382749d9482fadd59392d61f0d50f5ee985b330046ec0c6dae24b97e97e96b4a547b10ce77fcb6fdb27b1ed61477a786631cc1da5d0765723f498'
            'd230a703c8e54aafc55165b72c22a560ed9e65409489b2052aab70ce3930494b78966674f8af1db17a99e4e900bbaee49b58be442e605340c8102bd8c3c30eb5'
            '87c0f8c1ec8ce38fdd755153d0956a2fdb01789b31fcbd2109d11a6d70a239536e7a884c120f2d7e40046f6e0827e647e84e5650995f9ecb37786608bc4b1631'
            'a85f43dbb5cd1789dca8dde579bb741a71fd8ae35aa0aa9c82628d42e61d1ccfd59464af5f72b758593bf6164f6e7d63c4c40082fd9938452b2c23d5ea0ae045')

package() {
  # runtime dependency
  depends=('concrnt-gateway' 'concrnt-shared-config')

  mkdir -p ${pkgdir}/var/lib/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/dist" "${pkgdir}/var/lib/concrnt/web"
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/concrnt/config/webui/Caddyfile"
  install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/etc/concrnt/config/webui/nginx.conf"
  install -Dm644 "${srcdir}/concrnt-webui-caddy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-caddy.service"
  install -Dm644 "${srcdir}/concrnt-webui-nginx.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-nginx.service"
  install -Dm644 "${srcdir}/concrnt-webui.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-webui.hook"
  install -Dm644 "${srcdir}/concrnt-webui.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-webui.conf"
  
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
