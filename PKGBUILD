# Maintainer: Nanaka Hiira <hiira plus archlinux at hiira dot dev>

pkgname='concrnt-webui-bin'
pkgdesc='Concrnt registration page and admin panel'
pkgver=1.6.0
_pkgver=v${pkgver}
pkgrel=2
arch=('any')
url="https://github.com/totegamma/concurrent"
license=('MIT')
depends=('concrnt-gateway' 'concrnt-shared-config')

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
        "concrnt-webui.tmpfiles"
        "https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/code-of-conduct.txt"
        "https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/register-template.json"
        "https://github.com/totegamma/concurrent/raw/refs/tags/${_pkgver}/_docs/etc/static/tos.txt")
       

sha512sums=('ea478f9011f44c8e92554bc50389cc7de9fcb0e464d5cbb4882215a2f43c438ce964a3c024a25490e2a375bfd0671d132c96c42a432dceb96d80d1a841af592e'
            '6991f0cdffef328c29368d987a46e2d12d765b743cad04ae4c89469e1644f11f079fb495e5297b79d521f88b40d6fb3c5b972279c95f394bdb07cf4a2037f412'
            '2fb5bdae2bcdcf49ee4ff6bbfafd502b68c3d3942af36edebfa5baeff74db093d684ef4980e9f5f8eca2d531c7a41042706d223c893d1d0550b99410e1c9f25c'
            'a94c0f90ace2647bb4bc1242408dc73da581c8c9cf3f6aef8ccfbf24b85c5fc71fb778ea50b77f63efed2fcef96bef423fb7380e374cdf95a7f1e23344743796'
            '62075b7e1a0382749d9482fadd59392d61f0d50f5ee985b330046ec0c6dae24b97e97e96b4a547b10ce77fcb6fdb27b1ed61477a786631cc1da5d0765723f498'
            'd230a703c8e54aafc55165b72c22a560ed9e65409489b2052aab70ce3930494b78966674f8af1db17a99e4e900bbaee49b58be442e605340c8102bd8c3c30eb5'
            '87c0f8c1ec8ce38fdd755153d0956a2fdb01789b31fcbd2109d11a6d70a239536e7a884c120f2d7e40046f6e0827e647e84e5650995f9ecb37786608bc4b1631'
            'd2279597f4fc07fdd2befe969aeb377493f8faf0448947c3818fe04a8d2cc969e9c8c5591609b8b2008874d78b21e82e5a4e386b9d5346c3209cb20323d2ba80'
            '102ccbe40abcc3bcfec402433382b8e1700a8ba678a0f64610266a7f00f13ac0d9dc592651274dbbd1d2ad8775f5791caffda40e4feb668a8514ddae13eea738'
            '0a22a228785598f256b23bc9745f41ddf6851611d6898013884c7a1c1e27232920517fa738a5cb55e5b801c0cff599116958102724e0b513355469b81eea11db'
            'd5a9a9cad74bf6a5cf67af6bdd9db56f6344353560718f66042b4a29bc21ce43b7515c3bdd2669e60f22659cc4445439b980b89ab91e4bc6a187ac209e935d20')

backup=('etc/concrnt/static/code-of-conduct.txt'
        'etc/concrnt/static/register-template.json'
        'etc/concrnt/static/tos.txt')

package() {
  mkdir -p ${pkgdir}/var/lib/concrnt
  cp -dpTr --no-preserve=ownership "${srcdir}/dist" "${pkgdir}/var/lib/concrnt/web"
  install -Dm644 "${srcdir}/Caddyfile" "${pkgdir}/etc/concrnt/config/webui/Caddyfile"
  install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/etc/concrnt/config/webui/nginx.conf"
  install -Dm644 "${srcdir}/concrnt-webui-caddy.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-caddy.service"
  install -Dm644 "${srcdir}/concrnt-webui-nginx.service" "${pkgdir}/usr/lib/systemd/system/concrnt-webui-nginx.service"
  install -Dm644 "${srcdir}/concrnt-webui.hook" "${pkgdir}/usr/share/libalpm/hooks/concrnt-webui.hook"
  install -Dm644 "${srcdir}/concrnt-webui.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/concrnt-webui.conf"
  
  install -Dm644 "${srcdir}/code-of-conduct.txt" "${pkgdir}/etc/concrnt/static/code-of-conduct.txt"
  install -Dm644 "${srcdir}/register-template.json" "${pkgdir}/etc/concrnt/static/register-template.json"
  install -Dm644 "${srcdir}/tos.txt" "${pkgdir}/etc/concrnt/static/tos.txt"

  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
