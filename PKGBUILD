# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgbase=capi-shell
pkgname=(capi-shell capi-shell-plugin-capo capi-shell-plugin-api-endpoint-proxy)
pkgver=3.1.0
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
            '2237307764a7901acfbd7baf282acd0b41bdd7fa2486a2f52594a396533eb0dd1c9f0de2950e8e2ce36bb340384f9e323dde47290035b42128d1f5051408c82b'
            '6b5e8000540aeca5a2f015285c94a2c9b6917a857563a6b11254928b689550141ec9c44bf353f0d664a088e7e5068ee5f412ad28c2769f752ba004db974a9a55'
            'c2e5982c63a585594af091e0ed2940c2b94f9066b39f771eb603cd993abd9dc771469e7f6d8b0a503fe1bcc43955236b7cb52665dac4b7b845f972c2966205d1')

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
  depends=('capi-shell' 'yq' 'python-openstackclient')
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
