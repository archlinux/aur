# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=capi-shell
pkgname=(capi-shell capi-shell-plugin-capo capi-shell-plugin-api-endpoint-proxy)
pkgver=3.0.0
pkgrel=1
arch=('any')
license=('APACHE')
source=(
  capi-shell
  multi-capi-shell
  capi-shell-plugin-capo.sh
  capi-shell-plugin-api-endpoint-proxy.sh
  capi-shell-plugin-api-endpoint-proxy-provider-capo.sh
  capi-shell-plugin-api-endpoint-proxy-tool-sshuttle.sh
)
sha512sums=('f6641483b344ca7570b07e18f793217d1791d18bf00cdc293d569aabb5deedc87772138c11444edc40cb0b09a3af7203244ee2f274d3bf161c30d8928deafede'
            'b34fff12b2b319f0abc07473295affd5ee56a17431a69183d3b28eeae4297f0a29074109c4566a30f345b4af0bc64915a56865a28c121cac9b97ba543b69449d'
            '7f87251ad2e6128404faf6d1cc0c851bd01fa084ccde4b011e7b6d4f598dd3c4718671646442c38babcd364d3673946199c5f8b468fcf5f295ce33587928bd2d'
            'ed63ddb18d2f33691870f7122c4485c39e7c27b4c91b6af69e2c50bcc92e0dd9d1f4d6cdec7eaa6820be3e98f9bd14a46ae1b7ca095f4fff6b6e149388b3db17'
            '6b5e8000540aeca5a2f015285c94a2c9b6917a857563a6b11254928b689550141ec9c44bf353f0d664a088e7e5068ee5f412ad28c2769f752ba004db974a9a55'
            '1d4258541e821e091ab1c65f5579d97e4c6d7ff6a03b3a28a68f5bd012629a9d9f99d10be634312361e0a049a9299caf479f24247f8107231f66ad95183e6382')

package_capi-shell() {
  pkgdesc="Wrapper to start a tool or shell with KUBECONFIG and provider environment variables to interact with Cluster API-managed clusters"
  depends=('kubectl' 'yq')
  optdepends=('fzf: needed for multi-capi-shell'
              'capi-shell-plugin-capo: OpenStack/CAPO credentials support'
              'capi-shell-plugin-api-endpoint-proxy: proxying to private API servers')
  install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/capi-shell"
  install -D -m 0755 -t "$pkgdir/usr/bin/" "$srcdir/multi-capi-shell"
}

package_capi-shell-plugin-capo() {
  pkgdesc="OpenStack (CAPO) credentials plugin for capi-shell"
  depends=('capi-shell' 'yq')
  provides=('capo-shell')
  conflicts=('capo-shell')
  replaces=('capo-shell')
  install -D -m 0644 "$srcdir/capi-shell-plugin-capo.sh" "$pkgdir/usr/share/capi-shell/plugins/capo.sh"
}

package_capi-shell-plugin-api-endpoint-proxy() {
  pkgdesc="API server proxying plugin for capi-shell (sshuttle, with OpenStack/CAPO endpoint detection)"
  depends=('capi-shell' 'sshuttle' 'yq')
  install -D -m 0644 "$srcdir/capi-shell-plugin-api-endpoint-proxy.sh" "$pkgdir/usr/share/capi-shell/plugins/api-endpoint-proxy.sh"
  install -D -m 0644 "$srcdir/capi-shell-plugin-api-endpoint-proxy-provider-capo.sh" "$pkgdir/usr/share/capi-shell/plugins/api-endpoint-proxy/providers/capo.sh"
  install -D -m 0644 "$srcdir/capi-shell-plugin-api-endpoint-proxy-tool-sshuttle.sh" "$pkgdir/usr/share/capi-shell/plugins/api-endpoint-proxy/tools/sshuttle.sh"
}

#vim: syntax=sh
