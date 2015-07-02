# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgbase=neutron-liberty
pkgname=neutron-liberty
pkgname=('python2-neutron-liberty'
	 'neutron-liberty'
	 'neutron-dhcp-agent-liberty'
         'neutron-l3-agent-liberty'
         'neutron-metadata-agent-liberty'
         'neutron-metering-agent-liberty'
         'neutron-plugin-bigswitch-liberty'
         'neutron-plugin-bigswitch-agent-liberty'
         'neutron-plugin-brocade-liberty'
         'neutron-plugin-cisco-liberty'
	 'neutron-plugin-cisco-agent-liberty'
	 'neutron-plugin-embrane-liberty'
         'neutron-plugin-hyperv-agent-liberty'
         'neutron-plugin-ibm-liberty'
         'neutron-plugin-ibm-agent-liberty'
         'neutron-plugin-linuxbridge-liberty'
         'neutron-plugin-linuxbridge-agent-liberty'
         'neutron-plugin-metaplugin-liberty'
         'neutron-plugin-midonet-liberty'
         'neutron-plugin-ml2-liberty'
         'neutron-plugin-mlnx-liberty'
         'neutron-plugin-mlnx-agent-liberty'
         'neutron-plugin-nec-liberty'
         'neutron-plugin-nec-agent-liberty'
         'neutron-plugin-nuage-liberty'
         'neutron-plugin-oneconvergence-liberty'
         'neutron-plugin-oneconvergence-agent-liberty'
         'neutron-plugin-opencontrail-liberty'
         'neutron-plugin-openvswitch-liberty'
         'neutron-plugin-openvswitch-agent-liberty'
	 'neutron-plugin-ovsvapp-liberty'
	 'neutron-plugin-ovsvapp-agent-liberty'
         'neutron-plugin-plumgrid-liberty'
         'neutron-plugin-vmware-liberty'
         'neutron-plugin-sriovnic-agent-liberty')

pkgver=7.0.0.0b1
osseries=liberty-1
pkgrel=1
pkgdesc="A virtual network service for Openstack"
arch=(any)
url="https://launchpad.net/neutron"
license=('Apache')
depends=('python2' 'python2-setuptools')
makedepends=('python2-setuptools' 'python2-sphinx' 'python2-oslosphinx-liberty')
source=("https://launchpad.net/neutron/liberty/$osseries/+download/neutron-$pkgver.tar.gz"
        "neutron-dhcp-agent.service"
        "neutron-l3-agent.service"
        "neutron-metadata-agent.service"
        "neutron-metering-agent.service"
        "neutron-bigswitch-agent.service"
	"neutron-plugin-ibm-agent.service"
        "neutron-plugin-linuxbridge-agent.service"
        "neutron-plugin-mlnx-agent.service"
        "neutron-plugin-nec-agent.service"
	"neutron-plugin-oneconvergence-agent.service"
        "neutron-plugin-openvswitch-agent.service"
        "neutron-plugin-ryu-agent.service"
        "neutron-plugin-vpn-agent.service"
        "neutron-server-default"
        "neutron-server.service"
        "neutron_sudoers"
        "neutron.plugin.openvswitch.install")
md5sums=('0ac2c59efe56c5535b8edbc1a8305151'
         'c59c436057efbb2317487a0822aa97e7'
         'ca5d870e84ca2cce40bab18bf770870f'
         '1ab745acf0da636c4484803969229714'
         'ef5a00d81ecea910fb29706e3181fc80'
         'e0a25a272eaeb3b4f79404c2d2cd1379'
         'c954b9a3163fddac1623ec50ba7bfc98'
         '31ed220677df34466ca25fb1d64e9df0'
         '926c8fe2ec3fd79955ed8f74109fceea'
         '50bc95405d91d73a583c508a0446e38c'
         'de6e4e853477f3116b515fa9e80b306f'
         'f40d35da4256957eb0dd6e0ce6a4c696'
         '50946c6024c5043c7046968e6eb9b698'
         '9f2af5aef38b58a6b11f715059aecb95'
         '91d4643e9c29210cc82ec8c8c512675d'
         '7c710afee7078e7a52d3708acd158c26'
         '2cfc83f85ae2f8bc790e280da721262d'
         'fd68f680bfa312a0a17c705924cfe662')

build() {
  cd "neutron-$pkgver"
  sed -i 's|/usr/sbin/dnsmasq|/usr/bin/dnsmasq|g' etc/neutron/rootwrap.d/dhcp.filters
  python2 setup.py build
  python2 setup.py build_sphinx
  python2 setup.py install --root="$srcdir/tmp" --install-data="/" --optimize=1
}

package_python2-neutron-liberty() {
  pkgdesc+=" - Python library"
  depends=('python2-pbr>=0.11'
           'python2-paste'
           'python2-paste-deploy>=1.5.0'
           'python2-routes>=1.12.3'
           'python2-debtcollector>=0.3.0'
           'python2-eventlet>=0.17.3'
           'python2-greenlet>=0.3.2'
           'python2-httplib2>=0.7.5'
           'python2-requests>=2.5.2'
           'python2-jinja>=2.6'
           'python2-keystonemiddleware-liberty'
           'python2-netaddr>=0.7.12'
           'python2-neutronclient-liberty'
           'python2-retrying>=1.2.3'
           'python2-sqlalchemy-openstack'
           'python2-webob>=1.2.3'
           'python2-keystoneclient-liberty'
           'python2-alembic>=0.7.2'
           'python2-six>=1.9.0'
           'python2-stevedore-openstack'
           'python2-oslo-concurrency-liberty'
           'python2-oslo-config-liberty'
           'python2-oslo-context-liberty'
           'python2-oslo-db-liberty'
           'python2-oslo-i18n-liberty'
           'python2-oslo-log-liberty'
           'python2-oslo-messaging-liberty'
           'python2-oslo-middleware-liberty'
           'python2-oslo-policy-liberty'
           'python2-oslo-rootwrap-liberty'
           'python2-oslo-serialization-liberty'
           'python2-oslo-utils-liberty'
           'python2-novaclient-liberty'
           )
  conflics=('python2-quantum' 
            'python2-neutron'
            'python2-neutron-havana'
            'python2-neutron-icehouse'
            'python2-neutron-kilo'
            )

  cd tmp
  install -d ${pkgdir}/usr/lib/
  cp -R usr/lib/ ${pkgdir}/usr/
}

package_neutron-liberty() {
  pkgdesc+=" - Server"
  install=neutron.install
  depends=('python2-neutron-liberty')
  conflics=('quantum-common'
            'quantum-server'
            'neutron-common'
            'neutron-server'
            'neutron-havana'
            'neutron-icehouse')
  optdepends=('neutron-plugin-openvswitch-liberty')
  backup=('etc/neutron/api-paste.ini'
          'etc/neutron/neutron.conf')

  cd tmp
  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/api-paste.ini ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/l3_agent.ini ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/neutron.conf ${pkgdir}/etc/neutron/
  install -m 640 etc/neutron/policy.json ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.conf ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/debug.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/ipset-firewall.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/iptables-firewall.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 644 etc/neutron/rootwrap.d/l3.filters ${pkgdir}/etc/neutron/rootwrap.d/

  install -d -m 0750 ${pkgdir}/etc/sudoers.d/
  install -m 440 ${srcdir}/neutron_sudoers ${pkgdir}/etc/sudoers.d/
  
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-db-manage ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-debug ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-keepalived-state-change ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-netns-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ovs-cleanup ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap-daemon ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-rootwrap-xen-dom0 ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-sanity-check ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-usage-audit ${pkgdir}/usr/bin/

  install -d -m 0770 ${pkgdir}/var/lib/neutron/
  install -d -m 0770 ${pkgdir}/var/log/neutron/

  install -D -m 644 ${srcdir}/neutron-server-default ${pkgdir}/etc/default/neutron-server
  install -D -m 755 usr/bin/neutron-server ${pkgdir}/usr/bin/neutron-server
  install -D -m 644 ${srcdir}/neutron-server.service ${pkgdir}/usr/lib/systemd/system/neutron-server.service
}

package_neutron-dhcp-agent-liberty() {
  pkgdesc+=" - DHCP agent"
  depends=('neutron-liberty'
           'dnsmasq'
           'neutron-metadata-agent-liberty')
  conflics=('quantum-dhcp-agent' 'neutron-dhcp-agent' 'neutron-dhcp-agent-icehouse')
  backup=('etc/neutron/dhcp_agent.ini')

  cd tmp
  install -d ${pkgdir}/etc/neutron/rootwrap.d/
  install -m 640 etc/neutron/dhcp_agent.ini ${pkgdir}/etc/neutron/
  install -m 644 etc/neutron/rootwrap.d/dhcp.filters ${pkgdir}/etc/neutron/rootwrap.d/
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-dhcp-agent ${pkgdir}/usr/bin/
  install -D -m 644 ${srcdir}/neutron-dhcp-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-dhcp-agent.service
}

package_neutron-l3-agent-liberty() {
  pkgdesc+=" - l3 agent"
  depends=('neutron-liberty'
           'neutron-metadata-agent-liberty')
  conflics=('quantum-l3-agent'
            'neutron-l3-agent'
            'neutron-l3-agent-icehouse')
  backup=('etc/neutron/l3_agent.ini')

  cd tmp
  install -D -m 755 usr/bin/neutron-l3-agent ${pkgdir}/usr/bin/neutron-l3-agent
  install -D -m 644 ${srcdir}/neutron-l3-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-l3-agent.service
}

package_neutron-metadata-agent-liberty() {
  pkgdesc+=" - metadata agent"
  depends=('neutron-liberty')
  conflics=('quantum-metadata-agent'
            'neutron-metadata-agent'
            'neutron-metadata-agent-icehouse')
  backup=('etc/neutron/metadata_agent.ini')

  cd tmp
  install -D -m 640 etc/neutron/metadata_agent.ini ${pkgdir}/etc/neutron/metadata_agent.ini
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-metadata-agent ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-ns-metadata-proxy ${pkgdir}/usr/bin/
  install -D -m 644 ${srcdir}/neutron-metadata-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-metadata-agent.service
}

package_neutron-metering-agent-liberty() {
  pkgdesc+=" - metering agent"
  depends=('neutron-liberty')
  
  cd tmp
  install -D -m 640 etc/neutron/metering_agent.ini "${pkgdir}/etc/neutron/metering_agent.ini"
  install -D -m 755 usr/bin/neutron-metering-agent "${pkgdir}/usr/bin/neutron-metering-agent"
  install -D -m 644 "${srcdir}/neutron-metering-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-metering-agent.service"
}

package_neutron-plugin-bigswitch-liberty() {
  pkgdesc+=" - BigSwitch agent"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-bigswitch'
            'neutron-plugin-bigswtich'
            'neutron-plugin-bigswitch-icehouse')
  backup=('etc/neutron/plugins/bigswitch/restproxy.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/bigswitch/restproxy.ini ${pkgdir}/etc/neutron/plugins/bigswitch/restproxy.ini
  install -D -m 640 etc/neutron/plugins/bigswitch/ssl/ca_certs/README ${pkgdir}/etc/neutron/plugins/bigswitch/ssl/ca_certs
  install -D -m 640 etc/neutron/plugins/bigswitch/ssl/host_certs/README ${pkgdir}/etc/neutron/plugins/bigswitch/ssl/host_certs
}

package_neutron-plugin-bigswitch-agent-liberty() {
  pkgdesc+=" - BigSwitch plugin  agent"
  depends=('neutron-plugin-bigswitch-liberty')
  
  cd tmp
  install -D -m 755 usr/bin/neutron-restproxy-agent "${pkgdir}/usr/bin/neutron-restproxy-agent"
  install -D -m 644 "${srcdir}/neutron-bigswitch-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-bigswitch-agent.service"
}

package_neutron-plugin-brocade-liberty() {
  pkgdesc+=" - Brocade plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-brocade'
            'neutron-plugin-brocade'
            'neutron-plugin-brocade-icehouse')
  backup=('etc/neutron/plugins/brocade/brocade.ini')

  cd tmp
  install -d "${pkgdir}/etc/neutron/plugins/brocade/vyatta/"
  install -m 640 etc/neutron/plugins/brocade/brocade.ini ${pkgdir}/etc/neutron/plugins/brocade/brocade.ini
  install -m 640 etc/neutron/plugins/brocade/brocade_mlx.ini ${pkgdir}/etc/neutron/plugins/brocade/brocade_mlx.ini
  install -m 640 etc/neutron/plugins/brocade/vyatta/vrouter.ini ${pkgdir}/etc/neutron/plugins/brocade/vyatta/vrouter.ini
}

package_neutron-plugin-cisco-liberty() {
  pkgdesc+=" - Cisco plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-cisco'
            'neutron-plugin-cisco'
            'neutron-plugin-cisco-icehouse')
  backup=('etc/neutron/plugins/cisco/cisco_plugins.ini')

  cd tmp
  install -d ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_cfg_agent.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_plugins.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_router_plugin.ini ${pkgdir}/etc/neutron/plugins/cisco/
  install -m 640 etc/neutron/plugins/cisco/cisco_vpn_agent.ini ${pkgdir}/etc/neutron/plugins/cisco/
}

package_neutron-plugin-cisco-agent-liberty() {
  pkgdesc+=" - Cisco plugin agent"
  depends=('neutron-plugin-cisco-liberty')

  cd tmp
  install -d ${pkgdir}/usr/bin/
  install -m 755 usr/bin/neutron-cisco-apic-host-agent "${pkgdir}/usr/bin/neutron-cisco-apic-host-agent"
  install -m 755 usr/bin/neutron-cisco-apic-service-agent "${pkgdir}/usr/bin/neutron-cisco-apic-service-agent"
}

package_neutron-plugin-embrane-liberty() {
  pkgdesc+=" - embrane plugin"
  depends=('neutron-liberty')
  backup=('etc/neutron/plugins/embrane/heleos_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/embrane/heleos_conf.ini ${pkgdir}/etc/neutron/plugins/embrane/heleos_conf.ini
}

package_neutron-plugin-hyperv-agent-liberty() {
  pkgdesc+=" - Hyper-V plugin agent"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-hyperv')

  cd tmp
  install -D -m 755 usr/bin/neutron-hyperv-agent "${pkgdir}/usr/bin/neutron-hyperv-agent"
}

package_neutron-plugin-ibm-liberty() {
  pkgdesc+=" - IBM SDN plugin"
  depends=('neutron-liberty')
  backup=('etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini ${pkgdir}/etc/neutron/plugins/ibm/sdnve_neutron_plugin.ini
}

package_neutron-plugin-ibm-agent-liberty() {
  pkgdesc+=" - IBM SDN plugin agent"
  depends=('neutron-plugin-ibm-liberty')

  cd tmp
  install -D -m 755 usr/bin/neutron-ibm-agent "${pkgdir}/usr/bin/neutron-ibm-agent"
  install -D -m 755 "${srcdir}/neutron-plugin-ibm-agent.service" "${pkgdir}/usr/lib/systemd/system/neutron-plugin-ibm-agent.service"
}

package_neutron-plugin-linuxbridge-liberty() {
  pkgdesc+=" - linuxbridge plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-linuxbridge'
            'neutron-plugin-linuxbridge'
            'neutron-plugin-linuxbridge-icehouse')
  backup=('etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini ${pkgdir}/etc/neutron/plugins/linuxbridge/linuxbridge_conf.ini
}

package_neutron-plugin-linuxbridge-agent-liberty() {
  pkgdesc+=" - linuxbridge plugin agent"
  depends=('bridge-utils'
           'neutron-plugin-linuxbridge-liberty')
  conflics=('quantum-plugin-linuxbridge-agent'
            'neutron-plugin-linuxbridge-agent'
            'neutron-plugin-linuxbridge-agent-icehouse')

  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/linuxbridge-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/linuxbridge-plugin.filters
  install -D -m 755 usr/bin/neutron-linuxbridge-agent ${pkgdir}/usr/bin/neutron-linuxbridge-agent
  install -D -m 644 ${srcdir}/neutron-plugin-linuxbridge-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-linuxbridge-agent.service
}

package_neutron-plugin-metaplugin-liberty() {
  pkgdesc+=" - Metaplug	in plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-metaplugin'
            'neutron-plugin-metaplugin'
            'neutron-plugin-metaplugin-icehouse')
  backup=('etc/neutron/plugins/metaplugin/metaplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/metaplugin/metaplugin.ini ${pkgdir}/etc/neutron/plugins/metaplugin/metaplugin.ini
}

package_neutron-plugin-midonet-liberty() {
  pkgdesc+=" - Midonet plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-midonet'
            'neutron-plugin-midonet'
            'neutron-plugin-midonet-icehouse')
  backup=('etc/neutron/plugins/midonet/midonet.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/midonet/midonet.ini ${pkgdir}/etc/neutron/plugins/midonet/midonet.ini
}

package_neutron-plugin-ml2-liberty() {
  pkgdesc+=" - ML2 plugin"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-ml2-agent')
  backup=('etc/neutron/plugins/ml2/ml2_conf.ini'
          'etc/neutron/plugins/ml2/ml2_conf_arista.ini'
          'etc/neutron/plugins/ml2/ml2_conf_brocade.ini'
          'etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini'
          'etc/neutron/plugins/ml2/ml2_conf_cisco.ini'
          'etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini'
#          'etc/neutron/plugins/ml2/ml2_conf_mlnx.ini'
#          'etc/neutron/plugins/ml2/ml2_conf_ncs.ini'
          'etc/neutron/plugins/ml2/ml2_conf_ofa.ini'
          'etc/neutron/plugins/ml2/ml2_conf_sriov.ini'
#          'etc/neutron/plugins/ml2/nuage_plugin.ini'
#          'etc/neutron/plugins/ml2/restproxy.ini'
          )

  cd tmp
  install -d ${pkgdir}/etc/neutron/plugins/ml2/
  install -m 640 etc/neutron/plugins/ml2/ml2_conf.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_arista.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_arista.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_brocade.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_brocade.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_brocade_fi_ni.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_cisco.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_cisco.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_fslsdn.ini
#  install -m 640 etc/neutron/plugins/ml2/ml2_conf_mlnx.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_mlnx.ini
#  install -m 640 etc/neutron/plugins/ml2/ml2_conf_ncs.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ncs.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_ofa.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_ofa.ini
  install -m 640 etc/neutron/plugins/ml2/ml2_conf_sriov.ini ${pkgdir}/etc/neutron/plugins/ml2/ml2_conf_sriov.ini
#  install -m 640 etc/neutron/plugins/ml2/nuage_plugin.ini ${pkgdir}/etc/neutron/plugins/ml2/nuage_plugin.ini
#  install -m 640 etc/neutron/plugins/ml2/restproxy.ini ${pkgdir}/etc/neutron/plugins/ml2/restproxy.ini
}

package_neutron-plugin-mlnx-liberty() {
  pkgdesc+=" - MLNX plugin"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-mlnx-agent'
            'neutron-plugin-mlnx-agent-icehouse')
  backup=('etc/neutron/plugins/mlnx/mlnx_conf.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/mlnx/mlnx_conf.ini ${pkgdir}/etc/neutron/plugins/mlnx/mlnx_conf.ini
}

package_neutron-plugin-mlnx-agent-liberty() {
  pkgdesc+=" - MLNX plugin agent"
  depends=('neutron-plugin-mlnx-liberty')
  conflics=('neutron-plugin-mlnx-agent'
            'neutron-plugin-mlnx-agent-icehouse')

  cd tmp
  install -D -m 755 usr/bin/neutron-mlnx-agent ${pkgdir}/usr/bin/neutron-mlnx-agent
  install -D -m 644 ${srcdir}/neutron-plugin-mlnx-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-mlnx-agent.service
}

package_neutron-plugin-nec-liberty() {
  pkgdesc+=" - NEC plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-nec'
            'neutron-plugin-nec'
            'neutron-plugin-nec-icehouse')
  backup=('etc/neutron/plugins/nec/nec.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/nec/nec.ini ${pkgdir}/etc/neutron/plugins/nec/nec.ini
}

package_neutron-plugin-nec-agent-liberty() {
  pkgdesc+=" - NEC plugin agent"
  depends=('neutron-plugin-nec-liberty')
  conflics=('quantum-plugin-nec-agent'
            'neutron-plugin-nec-agent'
            'neutron-plugin-nec-agent-icehouse')

  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/nec-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/nec-plugin.filters
  install -D -m 755 usr/bin/neutron-nec-agent ${pkgdir}/usr/bin/neutron-nec-agent
  install -D -m 644 ${srcdir}/neutron-plugin-nec-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-nec-agent.service
}

package_neutron-plugin-nuage-liberty() {
  pkgdesc+=" - Nuage plugin"
  depends=('neutron-liberty')
  backup=('etc/neutron/plugins/nuage/nuage_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/nuage/nuage_plugin.ini ${pkgdir}/etc/neutron/plugins/nuage/nuage_plugin.ini
}

package_neutron-plugin-oneconvergence-liberty() {
  pkgdesc+=" - One Convergence plugin"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-oneconvergence')
  backup=('etc/neutron/plugins/oneconvergence/nvsdplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/oneconvergence/nvsdplugin.ini ${pkgdir}/etc/neutron/plugins/oneconvergence/nvsdplugin.ini
}

package_neutron-plugin-oneconvergence-agent-liberty() {
  pkgdesc+=" - One Convergence plugin agent"
  depends=('neutron-plugin-oneconvergence-liberty')
  conflics=('neutron-plugin-oneconvergence-agent')

  cd tmp
  install -D -m 755 usr/bin/neutron-nvsd-agent ${pkgdir}/usr/bin/neutron-nvsd-agent
  install -D -m 644 ${srcdir}/neutron-plugin-oneconvergence-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-oneconvergence-agent.service
}

package_neutron-plugin-opencontrail-liberty() {
  pkgdesc+=" - OpenContrail plugin"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-opencontrail')
  backup=('etc/neutron/plugins/opencontrail/contrailplugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/opencontrail/contrailplugin.ini ${pkgdir}/etc/neutron/plugins/opencontrail/contrailplugin.ini
}

package_neutron-plugin-openvswitch-liberty() {
  pkgdesc+=" - Open vSwitch plugin"
  install=neutron.plugin.openvswitch.install
  depends=('neutron-liberty')
  conflics=('quantum-plugin-openvswitch'
            'neutron-plugin-openvswitch'
            'neutron-plugin-openvswitch-icehouse')
  backup=('etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini ${pkgdir}/etc/neutron/plugins/openvswitch/ovs_neutron_plugin.ini
}

package_neutron-plugin-openvswitch-agent-liberty() {
  pkgdesc+=" - Open vSwitch plugin agent"
  depends=('openvswitch'
           'neutron-liberty'
           'neutron-plugin-openvswitch-liberty')
  conflics=('quantum-plugin-openvswitch-agent'
            'neutron-plugin-openvswitch-agent'
            'neutron-plugin-openvswitch-agent-icehouse')
  cd tmp
  install -D -m 644 etc/neutron/rootwrap.d/openvswitch-plugin.filters ${pkgdir}/etc/neutron/rootwrap.d/openvswitch-plugin.filters
  install -D -m 755 usr/bin/neutron-openvswitch-agent ${pkgdir}/usr/bin/neutron-openvswitch-agent
  install -D -m 644 ${srcdir}/neutron-plugin-openvswitch-agent.service ${pkgdir}/usr/lib/systemd/system/neutron-plugin-openvswitch-agent.service
}

package_neutron-plugin-ovsvapp-liberty() {
  pkgdesc+=" - OVSvApp plugin"
  depends=('neutron-liberty')
  backup=('etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini ${pkgdir}/etc/neutron/plugins/ovsvapp/ovsvapp_agent.ini
}

package_neutron-plugin-ovsvapp-agent-liberty() {
  pkgdesc+=" - OVSvApp plugin agent"
  depends=('neutron-plugin-ovsvapp-liberty')

  cd tmp
  install -D -m 755 usr/bin/neutron-ovsvapp-agent ${pkgdir}/usr/bin/neutron-ovsvapp-agent
}

package_neutron-plugin-plumgrid-liberty() {
  pkgdesc+=" - PLUMgrid plugin"
  depends=('neutron-liberty')
  conflics=('quantum-plugin-plumgrid'
            'neutron-plugin-plumgrid'
            'neutron-plugin-plumgrid-icehouse')
  backup=('etc/neutron/plugins/plumgrid/plumgrid.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/plumgrid/plumgrid.ini ${pkgdir}/etc/neutron/plugins/plumgrid/plumgrid.ini
}

package_neutron-plugin-vmware-liberty() {
  pkgdesc+=" - VMware plugin"
  depends=('neutron-liberty')
  conflics=('neutron-plugin-vmware')
  backup=('etc/neutron/plugins/vmware/nsx.ini')

  cd tmp
  install -D -m 640 etc/neutron/plugins/vmware/nsx.ini ${pkgdir}/etc/neutron/plugins/vmware/nsx.ini
}

package_neutron-plugin-sriovnic-agent-liberty() {
  pkgdesc+=" - SR-IOV plugin agent"
  depends=('neutron-liberty')

  cd tmp
  install -D -m 755 usr/bin/neutron-sriov-nic-agent ${pkgdir}/usr/bin/neutron-sriov-nic-agent
}

